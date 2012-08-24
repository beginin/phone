class User < ActiveRecord::Base
  attr_accessible :firstname, :job, :midlename, :secondname
  has_many :userlog
  validates :firstname, :secondname, :midlename , :presence => true
end
