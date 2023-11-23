class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @user = User.find(current_user_id)

    @event = @user.created_events.build(event_params)

    if @event.create
      redirect_to event_path(@event)
    else
      redirect_to :new, status: :unprocessable_entity
    end
  end

  def event_params
    params.require(:event).permit(:date,:location,:creator_id)
  end

end
