class Userlog < ActiveRecord::Base
  attr_accessible :cfu_id, :operator_id, :schedule_id, :sim_id, :sumlimit_id, :user_id, :userperiod_id
  belongs_to :user
  belongs_to :sumlimit
  belongs_to :cfu
  belongs_to :schedule
  belongs_to :userperiod
  belongs_to :operator

end
