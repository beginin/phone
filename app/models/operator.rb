class Operator < ActiveRecord::Base
  attr_accessible :opername
  has_many :userlog
end
