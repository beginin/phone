class Sumlimit < ActiveRecord::Base
  attr_accessible :money, :namelimit
  has_many :userlog
  validates :namelimit, :money, :presence => true
  validates :money, :length => { :in => 1..5 }, :numericality => { :only_integer => true } 
  validates :namelimit, :uniqueness => true
end
