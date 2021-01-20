class EventJob < ApplicationJob
  queue_as :default

  def perform(args)
    action_type = args[:action].class.name
    case action_type
    when 'Subscription'
      @event = args[:event]
      @subscription = args[:action]

      EventMailer.subscription(@event, @subscription).deliver_later
    when 'Photo'
      @event = args[:event]
      @photo = args[:action]
      @email = args[:email]

      all_email =
        (@event.subscriptions.pluck(:user_email) +
          [@event.user.email]).uniq - [@photo.user.email]

      all_email.each do
        EventMailer.photo(@event, @photo, @email).deliver_later
      end
    when 'Comment'
      @event = args[:event]
      @comment = args[:action]
      @email = @comment.user&.email

      all_email =
        (@event.subscriptions.pluck(:user_email) |
          @event.subscriptions.map(&:user_email) |
          [@event.user.email]) -
        [@email]

      all_email.each do
        EventMailer.comment(@event, @comment, @email).deliver_later
      end
    end
  end
end
