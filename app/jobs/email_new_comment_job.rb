class EmailNewCommentJob < ApplicationJob
  queue_as :default

  def perform(event, comment, email)
    @event = event
    @comment = comment
    @email = email

    EventMailer.comment(@event, @comment, @email).deliver_later
  end
end
