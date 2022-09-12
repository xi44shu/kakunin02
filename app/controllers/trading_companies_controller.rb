class TradingCompaniesController < ApplicationController
  def index
  end

  def new
    @tradingcompany = TradingCompany.new
  end

  def create
    @tradingcompany = TradingCompany.new(tradingcompany_params)
    if @tradingcompany.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def tradingcompany_params
    params.permit(:tc_name, :tc_contact_person, :tc_telephone )
  end

end
