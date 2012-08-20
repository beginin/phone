class Tnumber < ActiveRecord::Base
  attr_accessible :block, :sortnumber, :voicenumber, :tarif_id
  belongs_to :tarif
  has_many :simnumlog
end
