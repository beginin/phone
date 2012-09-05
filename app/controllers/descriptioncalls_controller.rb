class DescriptioncallsController < ApplicationController
  def index
  	@descriptioncall = Descriptioncall.all
  end

  def show
  end

  def edit
  	@descriptioncall = Descriptioncall.find(params[:id])
  end

  def update
  end
end
