class UploadController < ApplicationController
  def upload
  	post = DataFile.save(params[:upload])
  end

  def index
  	
  end
end
