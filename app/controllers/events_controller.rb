class EventsController < ApplicationController
  def index
    @event = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.admin = current_user

    if @event.save
      redirect_to @event
    else
      render :new
    end
  end



  private

  def event_params
    params.require(:event).permit(:title, :start_date, :duration, :description, :price, :location)
  end

end