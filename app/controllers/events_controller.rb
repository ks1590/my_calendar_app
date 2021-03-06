class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :destroy]
  # before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  
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
    # @event.save
    if @event.save      
    else      
      respond_to do |format|
        # format.html
        format.js { @status = "fail" }
      end
    end
    # respond_to do |format|
    #   if @event.save
    #     # format.html { redirect_to root_path }
    #     # format.json { render :json => @event }
    #     # format.js { @status = "success" }
    #     # format.js { render 'create.js.erb' }
    #     format.html
    #     format.json
    #     format.js
    #   else
    #     # format.html { render :new, status: :unprocessable_entity }
    #     # format.json { render json: @blog.errors, status: :unprocessable_entity }
    #     format.html
    #     format.js { @status = "fail" }
    #   end
    # end

    @current_week = Event.current_week.sum(:amount)
    @current_month = Event.current_month.sum(:amount)
    @last_month = Event.last_month.sum(:amount)
    @current_year = Event.current_year.sum(:amount)
  end

  def edit    
  end

  def update
    if @event.update(event_params)
    else      
      respond_to do |format|
        format.html
        format.js { @status = "fail" }
      end
    end 
    
    @current_week = Event.current_week.sum(:amount)
    @current_month = Event.current_month.sum(:amount)
    @last_month = Event.last_month.sum(:amount)
    @current_year = Event.current_year.sum(:amount)
  end  

  def destroy
    if @event.destroy
    else      
      respond_to do |format|
        format.html
        format.js { @status = "fail" }
      end
    end 
    
    @current_week = Event.current_week.sum(:amount)
    @current_month = Event.current_month.sum(:amount)
    @last_month = Event.last_month.sum(:amount)
    @current_year = Event.current_year.sum(:amount)
  end

  def chart
    @current_month = Event.current_month.sum(:amount).to_i
    @current_month = @current_month.to_s.gsub(/(\d)(?=(\d{3})+(?!\d))/, '\1,')

    months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

    @chart2 = LazyHighCharts::HighChart.new("graph") do |c|
      c.title(text: "??????<br>#{@current_month}???", align: "center", verticalAlign: 'middle' )
      # c.title(text: "?????????#{@current_month}???" )
      c.series({
        colorByPoint: true,        
        data: [{
        name: '??????',
        y: Event.joins(:category).current_week.where(category_id: 1).sum(:amount)
        }, {
        name: '?????????', 
        y: Event.joins(:category).current_week.where(category_id: 2).sum(:amount)
        }, {
        name: '?????????', 
        y: Event.joins(:category).current_week.where(category_id: 3).sum(:amount)
        }, {
        name: '??????????????????', 
        y: Event.joins(:category).current_week.where(category_id: 4).sum(:amount)
        }, {
        name: '??????', 
        y: Event.joins(:category).current_week.where(category_id: 5).sum(:amount)
        }, {
        name: '?????????', 
        y: Event.joins(:category).current_week.where(category_id: 6).sum(:amount)
        }, {
        name: '??????', 
        y: Event.joins(:category).current_week.where(category_id: 7).sum(:amount)
        }, {
        name: '??????', 
        y: Event.joins(:category).current_week.where(category_id: 8).sum(:amount)
        }, {
        name: '???????????????', 
        y: Event.joins(:category).current_week.where(category_id: 9).sum(:amount)
        }]
      })      
      c.plotOptions(pie: {        
        innerSize: '80%',
        allowPointSelect: true,
        cursor: 'pointer',          
        dataLabels: {          
          format: '{point.name}: {point.percentage:.1f} %',
          enabled: true, 
          distance: 0,
          allowOverlap: false,
          style: {
            color: '#555',               
            textAlign: 'center', 
            textOutline: 0,
          }}
        })   
      c.chart(type: "pie")              
    end

    @chart3 = LazyHighCharts::HighChart.new("graph") do |c|
      c.title(text: "??????<br>#{@current_month}???", align: "center", verticalAlign: 'middle' )
      # c.title(text: "?????????#{@current_month}???" )
      c.series({
        colorByPoint: true,        
        data: [{
        name: '??????',
        y: Event.joins(:category).current_month.where(category_id: 1).sum(:amount)
        }, {
        name: '?????????', 
        y: Event.joins(:category).current_month.where(category_id: 2).sum(:amount)
        }, {
        name: '?????????', 
        y: Event.joins(:category).current_month.where(category_id: 3).sum(:amount)
        }, {
        name: '??????????????????', 
        y: Event.joins(:category).current_month.where(category_id: 4).sum(:amount)
        }, {
        name: '??????', 
        y: Event.joins(:category).current_month.where(category_id: 5).sum(:amount)
        }, {
        name: '?????????', 
        y: Event.joins(:category).current_month.where(category_id: 6).sum(:amount)
        }, {
        name: '??????', 
        y: Event.joins(:category).current_month.where(category_id: 7).sum(:amount)
        }, {
        name: '??????', 
        y: Event.joins(:category).current_month.where(category_id: 8).sum(:amount)
        }, {
        name: '???????????????', 
        y: Event.joins(:category).current_month.where(category_id: 9).sum(:amount)
        }]
      })
      c.plotOptions(pie: {        
        innerSize: '80%',
        allowPointSelect: true,
        cursor: 'pointer',          
        dataLabels: {          
          format: '{point.name}: {point.percentage:.1f} %',
          enabled: true, 
          distance: 0,
          allowOverlap: false,
          style: {
            color: '#555',               
            textAlign: 'center', 
            textOutline: 0,
          }}
        })      
      c.chart(type: "pie")              
    end

    @chart4 = LazyHighCharts::HighChart.new("graph") do |c|
      c.title(text: "??????<br>#{@current_month}???", align: "center", verticalAlign: 'middle' )
      # c.title(text: "?????????#{@current_month}???" )
      c.series({
        colorByPoint: true,        
        data: [{
        name: '??????',
        y: Event.joins(:category).current_year.where(category_id: 1).sum(:amount)
        }, {
        name: '?????????', 
        y: Event.joins(:category).current_year.where(category_id: 2).sum(:amount)
        }, {
        name: '?????????', 
        y: Event.joins(:category).current_year.where(category_id: 3).sum(:amount)
        }, {
        name: '??????????????????', 
        y: Event.joins(:category).current_year.where(category_id: 4).sum(:amount)
        }, {
        name: '??????', 
        y: Event.joins(:category).current_year.where(category_id: 5).sum(:amount)
        }, {
        name: '?????????', 
        y: Event.joins(:category).current_year.where(category_id: 6).sum(:amount)
        }, {
        name: '??????', 
        y: Event.joins(:category).current_year.where(category_id: 7).sum(:amount)
        }, {
        name: '??????', 
        y: Event.joins(:category).current_year.where(category_id: 8).sum(:amount)
        }, {
        name: '???????????????', 
        y: Event.joins(:category).current_year.where(category_id: 9).sum(:amount)
        }]
      })      
      c.plotOptions(pie: {        
        innerSize: '80%',
        allowPointSelect: true,
        cursor: 'pointer',          
        dataLabels: {          
          format: '{point.name}: {point.percentage:.1f} %',
          enabled: true, 
          distance: 0,
          allowOverlap: false,
          style: {
            color: '#555',               
            textAlign: 'center', 
            textOutline: 0,
          }}
        })  
      c.chart(type: "pie")              
    end

    @bar = LazyHighCharts::HighChart.new('column') do |f|
      f.xAxis(categories: months, title: {text: '???'})
      f.yAxis(:stackLabels=>{:enabled=> true},title: {text: '???'})
      f.series(:name=>'??????',:data=> [300, 200, 320, 510, 430, 102, 122,300,300,300,3000,300 ])
      f.series(:name=>'?????????',:data=>[100, 30, 400, 130, 230, 530, 340, 46,300,300,300,3000 ])
      f.series(:name=>'?????????',:data=> [3300, 2020, 3220, 5110, 4230, 1302, 1122,3200,3500,300,300,300 ]) 
      f.series(:name=>'??????????????????',:data=> [3000, 1500, 1220, 4110, 2230, 902, 1522,1200,3100,300,300,300 ]) 
      f.series(:name=>'??????',:data=> [3300, 2020, 3220, 5110, 4230, 1302, 1122,3200,300,300,3500,3900 ]) 
      f.title({ :text=>"???????????????"})
      f.options[:chart][:defaultSeriesType] = "column"
      f.plot_options({:column=>{:stacking=>"normal"},:series=>{:dataLabels=>{:enabled=> true}}})      
      f.chart(type: "column",height: 550)  
    end

    @chart_globals = LazyHighCharts::HighChartGlobals.new do |f|
      f.global(useUTC: false)
      f.lang(thousandsSep: ",",
      numericSymbols: nil)
      # f.colors(["#f3d2c1", "#f9bc60", "#ffd803", "#abd1c6", "#bae8e8", "#fec7d7", "#ffa8ba", "#faae2b"])
      f.colors(["#FF9202", "#FF91AF", "#88CED3", "#393C99", "#3F62C4", "#4587CA", "#B8D808", "#78B45C", "#FFE053"])
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
