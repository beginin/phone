class Load < ActiveRecord::Base
  attr_accessible :admin, :created_at, :id
  has_many :colllog
end
