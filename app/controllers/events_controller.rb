class EventsController < ApplicationController
  before_action :set_event, except: [:index, :new, :create]
  after_action :verify_authorized, except: [:index, :show]

  def index
    @events = Event.all
  end

  def show
    if params[:pincode].present? && @event.pincode_valid?(params[:pincode])
      cookies.permanent["events_#{@event.id}_pincode"] = params[:pincode]
    end
    begin
      authorize @event
      @new_comment = @event.comments.build(params[:comment])
      @new_subscription = @event.subscriptions.build(params[:subscription])
      @new_photo = @event.photos.build(params[:photo])
    rescue Pundit::NotAuthorizedError
      flash.now[:alert] = t('.wrong_pincode') if params[:pincode].present?
      render 'password_form'
    end
  end

  def new
    authorize Event
    @event = current_user.events.build
  end

  def edit
    authorize @event
  end

  def create
    authorize Event
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to @event, notice: I18n.t('controllers.events.created')
    else
      render :new
    end
  end

  def update
    authorize @event
    if @event.update(event_params)
      redirect_to @event, notice: t('controllers.events.updated')
    else
      render :edit
    end
  end

  def destroy
    authorize @event
    @event.destroy
    redirect_to root_path, notice: t('controllers.events.destroyed')
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :address, :datetime, :description, :pincode)
  end
end
