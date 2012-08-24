class Simperiod < ActiveRecord::Base
  attr_accessible :datein, :dateout
  has_many :simnumlog
end
