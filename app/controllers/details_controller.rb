class DetailsController < ApplicationController
  def index
  end

  def new
    @detail = Detail.new
  end

  def create
    @detail = Detail.new(detail_params)
    if @detail.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def detail_params
    params.require(:detail).permit(:pipe_type_id, :pipe_size_id )
  end

end

