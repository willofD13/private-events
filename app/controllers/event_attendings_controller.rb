class EventAttendingsController < ApplicationController
  def index
    @event_attendings = EventAttending.all
  end

  def new
    @event_attending = EventAttending.new
  end
end
