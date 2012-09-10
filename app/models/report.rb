class Report < ActiveRecord::Base
	#attr_accessible :tnumber, :user_id, :sum
	belongs_to :user
	def self.columns
    @columns ||= []
  	end
 
  	def self.column(name, sql_type = nil, default = nil, null = true)
    	columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
 	end

 	def self.rep
 		sql = "WITH simnumlogs_full AS (
			SELECT * FROM simnumlogs
			LEFT JOIN simperiods ON  (simnumlogs.simperiod_id = simperiods.id)
			),
			userlogs_full AS ( 
			SELECT userlogs.id as userlogid ,userlogs.*, users.*, cfus.namecfu, sumlimits.money, userperiods.datein,  userperiods.dateout, schedules.*
			FROM userlogs
			LEFT JOIN users ON (userlogs.user_id = users.id)
			LEFT JOIN cfus ON (userlogs.cfu_id = cfus.id)
			LEFT JOIN sumlimits ON (userlogs.sumlimit_id = sumlimits.id)
			LEFT JOIN userperiods ON (userperiods.id = userlogs.userperiod_id)
			LEFT JOIN schedules ON (schedules.id = userlogs.schedule_id)
			),
			tnumbers_full AS (
			SELECT tnumbers.* , tarifs.name as tarifname
			from tnumbers 
			LEFT JOIN tarifs  ON (tnumbers.tarif_id = tarifs.id)
			),
			upr AS (
			SELECT colllogs.tnumber,tnumbers_full.tarifname , tnumbers_full.id as tnumberid ,userlogs_full.userlogid ,SUM(colllogs.coast)
			FROM colllogs 
			LEFT JOIN tnumbers_full ON (colllogs.tnumber = tnumbers_full.voicenumber)
			LEFT JOIN simnumlogs_full ON (tnumbers_full.id = simnumlogs_full.tnumber_id AND colllogs.date >= simnumlogs_full.datein AND 
			(colllogs.date <= simnumlogs_full.dateout OR simnumlogs_full.dateout IS NULL) )
			LEFT JOIN userlogs_full ON (simnumlogs_full.sim_id = userlogs_full.sim_id AND colllogs.date >= userlogs_full.datein AND 
			(colllogs.date <= userlogs_full.dateout OR userlogs_full.dateout IS NULL) )
			GROUP BY colllogs.tnumber,tnumbers_full.tarifname ,tnumberid , userlogid 
			),
			fin AS (
			SELECT colllogs.tnumber, tnumbers_full.id,userlogs_full.user_id,SUM(colllogs.coast)
			FROM colllogs 
			LEFT JOIN tnumbers_full ON (colllogs.tnumber = tnumbers_full.voicenumber)
			LEFT JOIN simnumlogs_full ON (tnumbers_full.id = simnumlogs_full.tnumber_id AND colllogs.date >= simnumlogs_full.datein AND 
			(colllogs.date <= simnumlogs_full.dateout OR simnumlogs_full.dateout IS NULL) )
			LEFT JOIN userlogs_full ON (simnumlogs_full.sim_id = userlogs_full.sim_id AND colllogs.date >= userlogs_full.datein AND 
			(colllogs.date <= userlogs_full.dateout OR userlogs_full.dateout IS NULL) )
			WHERE colllogs.descriptioncall_id NOT IN (SELECT id FROM descriptioncalls WHERE fin = 'true')
			AND colllogs.date NOT IN (SELECT hollyday FROM hollydays)
			AND \"time\"(colllogs.date) > userlogs_full.timein
			AND \"time\"(colllogs.date) < userlogs_full.timeout
			GROUP BY colllogs.tnumber ,tnumbers_full.id , userlogs_full.user_id
			)

			SELECT upr.tnumber,upr.tarifname,upr.sum as uprsum,fin.sum as sumfin , userlogs_full.secondname,userlogs_full.firstname,userlogs_full.midlename,
			userlogs_full.namecfu,userlogs_full.money,userlogs_full.datein,userlogs_full.dateout,userlogs_full.timein,
			userlogs_full.timeout
			FROM upr
			LEFT JOIN fin ON (fin.tnumber = upr.tnumber)
			LEFT JOIN userlogs_full ON (upr.userlogid = userlogs_full.userlogid)
			"
		#self.find_by_sql(sql)
		ActiveRecord::Base.connection.select_all( sql )
 		
 	end
 
  	# Manually define the columns used by this model
  	column :tnumber, :integer
  	column :uprsum, :deciaml
  	column :finsum, :deciaml
  	column :secondname, :string
 	column :firstname, :string
 	column :midlename, :string
 	column :namecfu, :string
 	column :money, :deciaml
 	column :datein, :timestamp
 	column :dateout, :timestamp
 	column :timein, :time
 	column :timeout, :time
end