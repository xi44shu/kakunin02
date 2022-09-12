class SchedulesController < ApplicationController

  def index
    @schedule = Schedule.all
    @schedule_a = Schedule.where(team_id: 1)
    @schedule_b = Schedule.where(team_id: 2)
    @schedule_c = Schedule.where(team_id: 3)
    @team = Team.all
    get_week
    @users = Schedule.page(params[:page]).per(4)
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to "/schedules/#{@schedule.id}"
    else
      render :new
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
    @showschedule = Showschedule.new
    @showschedules = @schedule.showschedules.includes(:user)
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
      @schedule = Schedule.find(params[:id])
      @schedule.delete
      redirect_to root_path
  end

  private

  def schedule_params
    params.require(:schedule).permit(:scheduled_date, :time_zone_id, :team_id).merge(user_id: current_user.id)
  end  

  def get_week
    wdays = ['(日)','(月)','(火)','(水)','(木)','(金)','(土)']

    # Dateオブジェクトは、日付を保持しています。下記のように`.today.day`とすると、今日の日付を取得できます。
    @todays_date = Date.today
    # 例)　今日が2月1日の場合・・・ Date.today.day => 1日

    @a_week_days = []
    @b_week_days = []
    @c_week_days = []

    plans = Schedule.where(scheduled_date: @todays_date..@todays_date + 6)

    7.times do |x|
    #   today_plans = []
    #   plans.each do |plan|
    #     today_plans.push(plan.time_zone_id) if plan.scheduled_date == @todays_date + x
    # end

    a_am_plans = []
    a_pm_plans = []
    b_am_plans = []
    b_pm_plans = []
    c_am_plans = []
    c_pm_plans = []

    plans.each do |plan|
      if plan.scheduled_date == @todays_date + x && plan.team_id ==1 &&plan.time_zone_id ==2
        a_am_plans.push(plan.scheduled_date,plan.team_id,plan.id)
      elsif plan.scheduled_date == @todays_date + x && plan.team_id ==1 &&plan.time_zone_id ==3
        a_pm_plans.push(plan.scheduled_date,plan.team_id,plan.id)
      elsif plan.scheduled_date == @todays_date + x && plan.team_id ==2 &&plan.time_zone_id ==2
        b_am_plans.push(plan.scheduled_date,plan.team_id,plan.id)
      elsif plan.scheduled_date == @todays_date + x && plan.team_id ==2 &&plan.time_zone_id ==3
        b_pm_plans.push(plan.scheduled_date,plan.team_id,plan.id)
      elsif plan.scheduled_date == @todays_date + x && plan.team_id ==3 &&plan.time_zone_id ==2
        c_am_plans.push(plan.scheduled_date,plan.team_id,plan.id)
      elsif plan.scheduled_date == @todays_date + x && plan.team_id ==3 &&plan.time_zone_id ==3
        c_pm_plans.push(plan.scheduled_date,plan.team_id,plan.id)
      end
    end

      wday_num = Date.today.wday + x
      if  wday_num >= 7
        wday_num = wday_num -7
      end
      a_days = { scheduled_date:(@todays_date + x), month: (@todays_date + x).month, date: (@todays_date + x).day, am_plans:  a_am_plans, pm_plans:  a_pm_plans, wday:  wdays[wday_num]}
      b_days = { scheduled_date:(@todays_date + x), month: (@todays_date + x).month, date: (@todays_date + x).day, am_plans:  b_am_plans, pm_plans:  b_pm_plans, wday:  wdays[wday_num]}
      c_days = { scheduled_date:(@todays_date + x), month: (@todays_date + x).month, date: (@todays_date + x).day, am_plans:  c_am_plans, pm_plans:  c_pm_plans, wday:  wdays[wday_num]}

      @a_week_days.push(a_days)
      @b_week_days.push(b_days)
      @c_week_days.push(c_days)
    end
  end

end
