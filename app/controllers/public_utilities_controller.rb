class PublicUtilitiesController < ApplicationController
  def index
  end

  def new
    @publicutilities = PublicUtilities.new
  end

  def create
    @publicutilities = PublicUtilities.new(publicutilities_params)
    if @publicutilities.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def publicutilities_params
    params.require(:publicutilities).permit(:pu_name )
  end

end
