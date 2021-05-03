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
    sum_month_1 = Event.where(date: "2021-01-01".in_time_zone.all_month).sum(:amount)
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
    product_C_sales = [   500_000,   500_000,   750_000,
      1_150_000, 1_350_000, 1_600_000 ] 

    anual_amount = [sum_month_1, sum_month_2, sum_month_3, sum_month_4, sum_month_5, sum_month_6, sum_month_7, sum_month_8, sum_month_9, sum_month_10, sum_month_11, sum_month_12]

    @chart = LazyHighCharts::HighChart.new("graph") do |c|
      c.title(text: "年間の支出")
      c.xAxis(categories: months, title: {text: '月'})
      # c.yAxis(title: {text: '円'},lang: {            
      #       numericSymbols: [' thousands', ' millions']
      #       })
      c.series(name: "支出", data: anual_amount)
      # c.legend(align: 'right', verticalAlign: 'top', 
      #   x: -100, y: 180, layout: 'vertical')
        
        c.setOptions({
          lang: {
            numericSymbols: nil
            # decimalPoint: '.',            
            # thousandsSep: ','
            }});
      c.chart(type: "column")      
    end

    @chart2 = LazyHighCharts::HighChart.new("graph") do |c|
      c.title(text: "支出<br>#{sum_month_5}",verticalAlign: 'middle',floating: true)
      c.series({
        colorByPoint: true,
        # ここでは各月の売上額合計をグラフの値とする
        data: [{
        name: 'A',
        y: product_A_sales.reduce{|sum,e| sum + e}
        }, {
        name: 'B', 
        y: product_B_sales.reduce{|sum,e| sum + e}
        }, {
        name: '食費', 
        y: product_C_sales.reduce{|sum,e| sum + e}
        }]
      })
      
      c.plotOptions(pie: {        
        innerSize: '70%',
        allowPointSelect: true,
        cursor: 'pointer',
        dataLabels: {
          enabled: true,
          format: '{point.name}: {point.percentage:.1f} %',
        },
        colors: ['#2f7ed8', '#0d233a', '#8bbc21', '#910000', '#1aadce',
      '#492970', '#f28f43', '#77a1e5', '#c42525', '#a6c96a'],
        lang: {thousandsSep: ","}
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
