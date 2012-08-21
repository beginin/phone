class Userperiod < ActiveRecord::Base
  attr_accessible :datein, :dateout
  has_many :userlog
end
