class Load < ActiveRecord::Base
  attr_accessible :admin, :created_at
  has_many :colllog
end
