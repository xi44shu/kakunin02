class TradingCompaniesController < ApplicationController
  def index
  end

  def new
    @tradingCompanies = TradingCompanies.new
  end

  def create
    @tradingCompanies = TradingCompanies.new(tradingCompanies_params)
    if @tradingCompanies.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def tradingCompanies_params
    params.require(:tradingCompanies).permit(:tc_name, :tc_contact_person, :tc_telephone )
  end

end
