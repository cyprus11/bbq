class CommentsController < ApplicationController
  before_action :set_event, only: [:create, :destroy]
  before_action :set_comment, only: [:destroy]

  def create
    @new_comment = @event.comments.build(comment_params)
    @new_comment.user = current_user

    if @new_comment.save
      notify_subscribers(@event, @new_comment)
      redirect_to @event, notice: t('controllers.comments.created')
    else
      render 'events/show', allert: t('controllers.comments.error')
    end
  end

  def destroy
    message = { notice: t('controllers.comments.destroyed') }
    if current_user_can_edit? @comment
      @comment.destroy!
    else
      message = { notice: t('controllers.comments.error') }
    end

    redirect_to @event, message
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_comment
    @comment = @event.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :user_name)
  end

  def notify_subscribers(event, comment)
    all_email =
      (event.subscriptions.pluck(:user_email) |
        event.subscriptions.map(&:user_email) |
        [event.user.email]) -
      [comment.user&.email]

    all_email.each do |mail|
      EventMailer.comment(event, comment, mail).deliver_now
      # EmailNewCommentJob.set(wait: 10.seconds).perform_later(event, comment, mail)
    end
  end
end
