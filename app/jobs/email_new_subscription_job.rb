class EmailNewSubscriptionJob < ApplicationJob
  queue_as :default

  def perform(event, subscription)
    @event = event
    @subscription = subscription

    EventMailer.subscription(@event, @subscription).deliver_later
  end
end
