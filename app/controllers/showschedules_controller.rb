class ShowschedulesController < ApplicationController

  def index
  end

  def new
    @showschedule = Showschedule.new
  end

  def create
    @showschedule = Showschedule.new(showschedule_params)
    if @showschedule.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def showschedule_params
    params.require(:showschedule).permit(:start_time, :trading_company_id, :public_utility_id, :schedule_id, :content )
  end

end
