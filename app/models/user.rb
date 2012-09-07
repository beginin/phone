class User < ActiveRecord::Base
  attr_accessible :firstname, :job, :midlename, :secondname
  has_many :userlog
  has_many :report
  validates :firstname, :secondname, :midlename , :presence => true
end
