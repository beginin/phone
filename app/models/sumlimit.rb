class Sumlimit < ActiveRecord::Base
  attr_accessible :money, :namelimit
  has_many :userlog
end
