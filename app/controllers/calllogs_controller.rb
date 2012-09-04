class CalllogsController < ApplicationController
  def index
  	@calllog=Colllog.limit(100)
  end
end
