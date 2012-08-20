class Tnumber < ActiveRecord::Base
  attr_accessible :block, :sortnumber, :voicenumber, :tarif_id
  belongs_to :tarif
  has_many :simnumlog
  def self.freenumbers_id
    simactive = Simnumlog.select(:sim_id).joins(:simperiod).where("'simperiods'.'dateout'  IS NULL ")
    sa_id=Array.new
    simactive.find_each do |d|
      sa_id=sa_id+[d.sim_id]
    end
    simall = Sim.select(:id)
    sl_id=Array.new
    simall.find_each do |d|
      sl_id = sl_id+[d.id]
    end
    sl_id
    sl_id - sa_id
  end
end
