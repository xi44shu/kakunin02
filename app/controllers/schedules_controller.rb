class SchedulesController < ApplicationController

  def index
    @schedule = Schedule.all
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
end
