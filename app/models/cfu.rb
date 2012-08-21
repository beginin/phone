class Cfu < ActiveRecord::Base
  attr_accessible :namecfu
  has_many :userlog
end
