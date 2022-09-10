class SchedulesController < ApplicationController

  def index
    @schedule = Schedule.all
    @team = Team.all
    get_week

  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to root_path
    else
      render :new
    end
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

    @week_days = []

    plans = Schedule.where(scheduled_date: @todays_date..@todays_date + 6)

    7.times do |x|
    #   today_plans = []
    #   plans.each do |plan|
    #     today_plans.push(plan.time_zone_id) if plan.scheduled_date == @todays_date + x
    # end

    a_am_plans = []
    plans.each do |plan|
      a_am_plans.push(plan.time_zone_id) if plan.scheduled_date == @todays_date + x && plan.team_id ==1 &&plan.time_zone_id ==2
  end

      wday_num = Date.today.wday + x
      if  wday_num >= 7
        wday_num = wday_num -7
      end
      days = { month: (@todays_date + x).month, date: (@todays_date + x).day, plans:  a_am_plans, wday:  wdays[wday_num]}

      @week_days.push(days)
    end
  end

end
