class Simnumlog < ActiveRecord::Base
  attr_accessible :sim_id, :simperiod_id, :tnumber_id
  belongs_to :sim
  belongs_to :simperiod
  belongs_to :tnumber
end
