class EventAttendingsController < ApplicationController
  def index
    @event_attendings = EventAttending.all
  end

  def new
    @event_attending = EventAttending.new
  end

  def create
    @event = Event.find(params[:event_id])
    @event_attending = @event.event_attendings.create(event_attending_params)

    if @event_attending.save
      redirect_to root_path
    else
      redirect_to events_path, status: :unprocessable_entity
    end
  end

  def event_attending_params
    params.require(:event_attending).permit(:attended_event_id,:event_attendee_id)
  end
end
