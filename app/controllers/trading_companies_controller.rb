class TradingCompaniesController < ApplicationController
  def index
  end

  def new
    @tradingCompany = TradingCompany.new
  end

  def create
    @tradingCompany = TradingCompany.new(tradingcompany_params)
    if @tradingCompany.save
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
