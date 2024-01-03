class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:new,:index]

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

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to root_path, status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    
    redirect_to root_path, status: :see_other
  end

  private
  def event_params
    params.require(:event).permit(:title,:body,:date,:location,:creator_id)
  end

end
