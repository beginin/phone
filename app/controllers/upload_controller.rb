class UploadController < ApplicationController
  def upload
  	post = Colllog.save(params[:upload])
  end

  def index
  	
  end
end
