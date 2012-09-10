class ReportController < ApplicationController
  def index
  	@report1 = Load.find(:all , :order => "id DESC" )
  end

  def showload
  	@report1 = Report.rep
  end
end
