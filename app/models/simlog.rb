class Simlog < ActiveRecord::Base
  attr_accessible :pda, :period_id, :sim_id, :user_id
  belongs_to :user
  belongs_to :sim
  belongs_to :user
  belongs_to :period
end
