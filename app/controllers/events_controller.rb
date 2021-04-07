class EventsController < ApplicationController
  def index
    @event = Event.new
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)
    @event.save
  end
  
  private
  def event_params
    params.require(:event).permit(:title, :start, :end)
  end
  
end
