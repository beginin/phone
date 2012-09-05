class Colllog < ActiveRecord::Base
  attr_accessible :tnumber, :base, :coast, :date, :descriptioncall_id, :duration, :load_id, 
  					:tnumber_in, :tnumber_out, :typecall_id, :typeconnect_id, :valuemb,
  					:typecall_text, :descriptioncall_text, :typeconnect_text
  belongs_to :typecall
  belongs_to :typeconnect
  belongs_to :load
  belongs_to :descriptioncall

 
  def self.save(upload)
    name =  upload['csv'].original_filename
    directory = "public/data"
    # create the file path
    path = File.join(directory, name)
    # write the file
    #File.open(path, "wb") { |f| f.write(upload['csv'].read) }
    content = upload['csv'].read
    detection = CharlockHolmes::EncodingDetector.detect(content)
    utf8_encoded_content = CharlockHolmes::Converter.convert content, detection[:encoding], 'UTF-8'
    #logger.debug "Привет #{utf8_encoded_content}"
    csvarray = FasterCSV.parse(utf8_encoded_content, :col_sep => ';')
    csvarray.delete(csvarray.first)
    load=Load.create(:admin => "Admin") 

    csvarray.each do |row|
    	n=Colllog.new
    	n.tnumber = row[2]
    	n.date = row[3].gsub("/",".") + " " + row[4]
    	n.duration = row[5]
    	n.coast = row[7].gsub(",",".")
    	n.tnumber_out = row[8]
    	n.tnumber_in = row[9]
    	n.typecall_text = row[10]
    	n.descriptioncall_text = row[11]
    	n.typeconnect_text = row[12]
    	n.base = row[13]
    	n.valuemb = row[14]
      n.load_id = load
    	n.save
    end
    #File.open(path, "wb") { |f| f.write(utf8_encoded_content) }
  end

  def descriptioncall_text
     descriptioncall.try(:name)
  end

  def descriptioncall_text=(name)
    self.descriptioncall = Descriptioncall.find_or_create_by_name(name) if name.present?
  end

  def typecall_text
     typecall.try(:name)
  end

  def typecall_text=(name)
    self.typecall = Typecall.find_or_create_by_name(name) if name.present?
  end

  def typeconnect_text
     typeconnect.try(:name)
  end

  def typeconnect_text=(name)
    self.typeconnect = Typeconnect.find_or_create_by_name(name) if name.present?
  end
end
