class EmailNewPhotoJob < ApplicationJob
  queue_as :default

  def perform(event, photo, email)
    @event = event
    @photo = photo
    @email = email

    EventMailer.photo(event, photo, email).deliver_later
  end
end
