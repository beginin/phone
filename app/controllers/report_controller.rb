class ReportController < ApplicationController
  def index
  	@loads = Load.find(:all , :order => "id DESC" )
  end

  def show
  	@report1 = Report.rep(params[:id])
  end
end
