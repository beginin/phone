class Userlog < ActiveRecord::Base
  attr_accessible :cfu_id, :operator_id, :schedule_id, :sim_id, :sumlimit_id, :user_id, :userperiod_id
end
