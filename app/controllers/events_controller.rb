class EventsController < ApplicationController
  before_action :set_event, only: [:edit]

  def index
    @event = Event.new
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)
    @event.save
  end

  def edit    
  end
  
  
  private
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :start, :end)
  end
  
end
