class Tnumber < ActiveRecord::Base
  attr_accessible :block, :sortnumber, :voicenumber, :tarif_id
  belongs_to :tarif
  has_many :simnumlog
  def self.freetnumbers_id
    tnumberactive = Simnumlog.select(:tnumber_id).joins(:simperiod).where("'simperiods'.'dateout'  IS NULL ")
    ta_id=Array.new
    tnumberactive.find_each do |d|
      ta_id=ta_id+[d.tnumber_id]
    end
    tnumberall = Tnumber.select(:id)
    tl_id=Array.new
    tnumberall.find_each do |d|
      tl_id = tl_id+[d.id]
    end
    tl_id - ta_id
  end
end
