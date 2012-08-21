class User < ActiveRecord::Base
  attr_accessible :firstname, :job, :midlename, :secondname
end
