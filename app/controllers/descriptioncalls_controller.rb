class DescriptioncallsController < ApplicationController
  def index
  	@descriptioncall = Descriptioncall.find(:all, :order => 'name ASC')
  end

  def show
  end

  def edit
  	@descriptioncall = Descriptioncall.find(params[:id])
  end

  def update
    @descriptioncall = Descriptioncall.find(params[:id])

    respond_to do |format|
      if @descriptioncall.update_attributes(params[:descriptioncall])
        format.html { redirect_to descriptioncalls_path, :notice => 'Cfu was successfully updated.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end
end
