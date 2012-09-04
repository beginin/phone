class Typeconnect < ActiveRecord::Base
  attr_accessible :name
  has_many :colllog
end
