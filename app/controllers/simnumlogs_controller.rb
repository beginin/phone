class SimnumlogsController < ApplicationController
  # GET /simnumlogs
  # GET /simnumlogs.json
  def index
    @simnumlogs = Simnumlog.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @simnumlogs }
    end
  end

  # GET /simnumlogs/1
  # GET /simnumlogs/1.json
  def show
    @simnumlog = Simnumlog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @simnumlog }
    end
  end

  # GET /simnumlogs/new
  # GET /simnumlogs/new.json
  def new
    @simnumlog = Simnumlog.new
    #@simperiod = Simperiod.new
    #@tnumber
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @simnumlog }
    end
  end

  # GET /simnumlogs/1/edit
  def edit
    @simnumlog = Simnumlog.find(params[:id])
  end

  # POST /simnumlogs
  # POST /simnumlogs.json
  def create
    @simnumlog = Simnumlog.new(:sim_id => params[:simnumlog][:sim_id],:tnumber_id => params[:simnumlog][:tnumber_id])
    date = params[:simnumlog]["simperiod_id(1i)"] + '-'
    date = date + params[:simnumlog]["simperiod_id(2i)"].to_s + '-'
    date = date + params[:simnumlog]["simperiod_id(3i)"].to_s + ' '
    date = date + params[:simnumlog]["simperiod_id(4i)"].to_s + ':'
    date = date + params[:simnumlog]["simperiod_id(5i)"].to_s
    @simperiod = Simperiod.create(:datein => date) 
    @simnumlog.simperiod_id = @simperiod.id
    respond_to do |format|
    if @simnumlog.save
        format.html { redirect_to @simnumlog, :notice => date}
        format.json { render :json => @simnumlog, :status => :created, :location => @simnumlog }
      else
        format.html { render :action => "new" }
        format.json { render :json => @simnumlog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /simnumlogs/1
  # PUT /simnumlogs/1.json
  def update
    @simnumlog = Simnumlog.find(params[:id])

    respond_to do |format|
      if @simnumlog.update_attributes(params[:simnumlog])
        format.html { redirect_to @simnumlog, :notice => 'Simnumlog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @simnumlog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /simnumlogs/1
  # DELETE /simnumlogs/1.json
  def destroy
    @simnumlog = Simnumlog.find(params[:id])
    @simnumlog.destroy

    respond_to do |format|
      format.html { redirect_to simnumlogs_url }
      format.json { head :no_content }
    end
  end
  def endperiod
    @simnumlog = Simnumlog.find(params[:id])
    @simnumlog.simperiod.dateout=Time.now
    @simnumlog.simperiod.save
    respond_to do |format|
      format.html { redirect_to simnumlogs_url }
      format.json { head :no_content }
    end
  end
end
