class EventMailer < ApplicationMailer
  def subscription(event, subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @event = event

    mail to: event.user.email, subject: t('.subject', title: @event.title)
  end

  def comment(event, comment, email)
    @comment = comment
    @event = event

    mail to: email, subject: t('.subject', title: @event.title)
  end

  def photo(event, photo, email)
    @event = event
    @photo = photo

    mail to: email, subject: t('.subject', title: @event.title)
  end
end
