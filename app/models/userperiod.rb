class Userperiod < ActiveRecord::Base
  attr_accessible :datein, :dateout, :datein_text, :userlog_attributes, :endperiod
  has_many :userlog
  accepts_nested_attributes_for :userlog

  validates :datein, :presence => true

  def datein_text 
  	#datein.try (:strftime, "%Y-%m-%d %H:%M")
	datein.strftime("%Y-%m-%d %H:%M")
  end

  def datein_text=(time)
  	self.datein = Time.zone.parse(time) if time.present?
  end

  def userlog_attributes=(userlog_attributes)
  attributes=userlog_attributes.first.fetch(1)
  #userlog_attributes.each do |attributes|
  	#a=YAML::dump(attributes.fetch(1))
  	#p= Hash.new
  	#p["cfu_id"] = attributes.fetch(1).fetch("cfu_id")
  	#p["sim_id"] = attributes.fetch(1).fetch("sim_id")
  	#p["sumlimit_id"] = attributes.fetch(1).fetch("sumlimit_id")
  	#p["schedule_id"] = attributes.fetch(1).fetch("cfu_id")
  	#p["operator_id"] = attributes.fetch(1).fetch("operator_id")
  	#p["user_id"] = attributes.fetch(1).fetch("user_id")
  	#a=attributes.first
  	#logger.debug "Привет: #{p}"
  	#logger.debug "Досвидание: #{YAML::dump(userlog.build(p))}"
  	 userlog.build(attributes)
  #end
  end

  def endperiod
    self.dateout = Time.zone.now if self.dateout.blank?
  end
end
