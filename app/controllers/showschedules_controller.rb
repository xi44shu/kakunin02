class ShowschedulesController < ApplicationController

  def index
  end

  def new
    @showschedule = Showschedule.new
  end

  def create
    @showschedule = Showschedule.new(showschedule_params)

    if @showschedule.save
      redirect_to "/schedules/#{@showschedule.schedule.id}"
    else
      render :new
    end
  end

  private

  def showschedule_params
    params.require(:showschedule).permit(:trading_company_id, :content, :start_time).merge(user_id: current_user.id, schedule_id: params[:schedule_id])
  end

end