class EventJob < ApplicationJob
  queue_as :default

  def perform(args)
    case args[:action]
    when Subscription
      event = args[:event]
      subscription = args[:action]

      EventMailer.subscription(event, subscription).deliver_later
    when Photo
      event = args[:event]
      photo = args[:action]

      all_email =
        (event.subscriptions.pluck(:user_email) +
          [event.user.email]).uniq - [photo.user.email]

      all_email.each do |mail|
        EventMailer.photo(event, photo, mail).deliver_later
      end
    when Comment
      event = args[:event]
      comment = args[:action]
      email = comment.user&.email

      all_email =
        (event.subscriptions.map(&:user_email) |
          [event.user.email]) -
          [email]

      all_email.each do |mail|
        EventMailer.comment(event, comment, mail).deliver_later
      end
    end
  end
end
