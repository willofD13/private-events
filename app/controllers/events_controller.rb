class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @user = User.find(current_user.id)

    @event = @user.created_events.build(event_params)

    if @event.save
      redirect_to user_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def event_params
    params.require(:event).permit(:title,:body,:date,:location,:creator_id)
  end

end
