class Descriptioncall < ActiveRecord::Base
  attr_accessible :fin, :name
  has_many :colllog
end
