class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :destroy]

  def index
    @event = Event.new
    @events = Event.all
    # @events = Event.pluck(:id, :date, "CONCAT_WS(' ', title, amount) as title", :amount, :note) 
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
  end

  def edit    
  end

  def update
    @event.update(event_params)
  end  

  def destroy
    @event.destroy
  end
  
  private
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:id, :date,:title, :amount, :note)
  end
  
end
