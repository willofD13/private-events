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
      redirect_to event_path(@event.id), notice: "You are successfully listed as an attendee for #{@event.title}."
    else
      redirect_to events_path, status: :unprocessable_entity
    end
  end

  def destroy
    @event_attending = EventAttending.find_by(attended_event_id: params[:event_id], event_attendee_id: current_user.id)
    @event_attending.destroy

    redirect_to root_path, status: :see_other, notice: "You have been removed from #{@event_attending.attended_event.title} list of attendees."
  end

  def event_attending_params
    params.require(:event_attending).permit(:attended_event_id,:event_attendee_id)
  end
end
