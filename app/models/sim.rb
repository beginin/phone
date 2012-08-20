class Sim < ActiveRecord::Base
  attr_accessible :sirealnumber
  has_many :simnumlog
end
