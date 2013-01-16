class Period < ActiveRecord::Base
  attr_accessible :datein, :dateout, :datein_text, :simlog_attributes
  has_many :simlog
  accepts_nested_attributes_for :simlog
  def datein_text 
  	#datein.try (:strftime, "%Y-%m-%d %H:%M")
	datein.strftime("%Y-%m-%d %H:%M")
  end

  def datein_text=(time)
  	self.datein = Time.zone.parse(time) if time.present?
  end
  
  def simlog_attributes=(simlog_attributes)
  attributes=simlog_attributes.first.fetch(1)
  simlog.build(attributes)
  end



end
