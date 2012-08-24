class Schedule < ActiveRecord::Base
  attr_accessible :timein, :timeout
  has_many :userlog
end
