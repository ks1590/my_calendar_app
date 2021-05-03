class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :destroy]
  
  def index
    @event = Event.new
    @events = Event.joins(:payment).joins(:category)
    @current_week = Event.current_week.sum(:amount)
    @current_month = Event.current_month.sum(:amount)
    @last_month = Event.last_month.sum(:amount)
    @current_year = Event.current_year.sum(:amount)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save        
    @current_week = Event.current_week.sum(:amount)
    @current_month = Event.current_month.sum(:amount)
    @last_month = Event.last_month.sum(:amount)
    @current_year = Event.current_year.sum(:amount)    
  end

  def edit    
  end

  def update
    @event.update(event_params)
    @current_week = Event.current_week.sum(:amount)
    @current_month = Event.current_month.sum(:amount)
    @last_month = Event.last_month.sum(:amount)
    @current_year = Event.current_year.sum(:amount)
  end  

  def destroy
    @event.destroy
    @current_week = Event.current_week.sum(:amount)
    @current_month = Event.current_month.sum(:amount)
    @last_month = Event.last_month.sum(:amount)
    @current_year = Event.current_year.sum(:amount)
  end

  def chart
    # @sum_month_1 = Event.where(date: "2021-01-01".in_time_zone.all_month).sum(:amount)
    sum_month_2 = Event.where(date: "2021-02-01".in_time_zone.all_month).sum(:amount)
    sum_month_3 = Event.where(date: "2021-03-01".in_time_zone.all_month).sum(:amount)
    sum_month_4 = Event.where(date: "2021-04-01".in_time_zone.all_month).sum(:amount)
    sum_month_5 = Event.where(date: "2021-05-01".in_time_zone.all_month).sum(:amount)
    sum_month_6 = Event.where(date: "2021-06-01".in_time_zone.all_month).sum(:amount)
    sum_month_7 = Event.where(date: "2021-07-01".in_time_zone.all_month).sum(:amount)
    sum_month_8 = Event.where(date: "2021-08-01".in_time_zone.all_month).sum(:amount)
    sum_month_9 = Event.where(date: "2021-09-01".in_time_zone.all_month).sum(:amount)
    sum_month_10 = Event.where(date: "2021-10-01".in_time_zone.all_month).sum(:amount)
    sum_month_11 = Event.where(date: "2021-11-01".in_time_zone.all_month).sum(:amount)
    sum_month_12 = Event.where(date: "2021-12-01".in_time_zone.all_month).sum(:amount)

    months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    product_A_sales = [ 1_000_000, 1_200_000, 1_300_000,
      1_400_000, 1_200_000, 1_100_000, 1_000_000, 1_000_000, 1_000_000, 2_000_000, 1_055_000, 1_040_000]
    product_B_sales = [   300_000,   500_000,   750_000,
      1_150_000, 1_350_000, 1_600_000 ] 
    @sum_month_1 = [   500_000,   500_000,   750_000,
      1_150_000, 1_350_000, 1_600_000 ] 

    # anual_amount = [sum_month_1, sum_month_2, sum_month_3, sum_month_4, sum_month_5, sum_month_6, sum_month_7, sum_month_8, sum_month_9, sum_month_10, sum_month_11, sum_month_12]

  end
  
  private
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:id, :date,:title, :amount, :note, :payment_id, :category_id)
  end
  
end
