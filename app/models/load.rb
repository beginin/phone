class Load < ActiveRecord::Base
  attr_accessible :admin
  has_many :colllog
end
