class PublicUtilitiesController < ApplicationController
  def index
  end

  def new
    @publicutility = PublicUtility.new
  end

  def create
    @publicutility = PublicUtility.new(publicutility_params)
    if @publicutility.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def publicutility_params
    params.permit(:pu_name )
  end

end
