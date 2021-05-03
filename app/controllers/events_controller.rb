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
    months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    product_A_sales = [ 1_000_000, 1_200_000, 1_300_000,
      1_400_000, 1_200_000, 1_100_000, 1_000_000, 1_000_000, 1_000_000, 2_000_000, 1_055_000, 1_040_000]
    product_B_sales = [   300_000,   500_000,   750_000,
      1_150_000, 1_350_000, 1_600_000 ] 
    @chart = LazyHighCharts::HighChart.new("graph") do |c|
      c.title(text: "年間の支出")
      c.xAxis(categories: months, title: {text: '月'})
      c.yAxis(title: {text: '円'})
      c.series(name: "A", data: product_A_sales)
      c.legend(align: 'right', verticalAlign: 'top', 
        x: -100, y: 180, layout: 'vertical')
      c.chart(type: "column")
    end

    @chart2 = LazyHighCharts::HighChart.new("graph") do |c|
      c.title(text: "支出",verticalAlign: 'middle',floating: true)
      c.series({
        colorByPoint: true,
        # ここでは各月の売上額合計をグラフの値とする
        data: [{
        name: 'A',
        y: product_A_sales.reduce{|sum,e| sum + e}
        }, {
        name: 'B', 
        y: product_B_sales.reduce{|sum,e| sum + e}
        }]
      })
      
      c.plotOptions(pie: {        
          innerSize: '70%',
          allowPointSelect: true,
          cursor: 'pointer',
          dataLabels: {
            enabled: true,
            format: '{point.name}: {point.percentage:.1f} %',
          }        
        })      
      c.chart(type: "pie")
              
    end
  end
  
  private
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:id, :date,:title, :amount, :note, :payment_id, :category_id)
  end
  
end
