class HollydaysController < ApplicationController
  # GET /hollydays
  # GET /hollydays.json
  def index
    @hollydays = Hollyday.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @hollydays }
    end
  end

  # GET /hollydays/1
  # GET /hollydays/1.json
  def show
    @hollyday = Hollyday.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @hollyday }
    end
  end

  # GET /hollydays/new
  # GET /hollydays/new.json
  def new
    @hollyday = Hollyday.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @hollyday }
    end
  end

  # GET /hollydays/1/edit
  def edit
    @hollyday = Hollyday.find(params[:id])
  end

  # POST /hollydays
  # POST /hollydays.json
  def create
    @hollyday = Hollyday.new(params[:hollyday])

    respond_to do |format|
      if @hollyday.save
        format.html { redirect_to @hollyday, :notice => 'Hollyday was successfully created.' }
        format.json { render :json => @hollyday, :status => :created, :location => @hollyday }
      else
        format.html { render :action => "new" }
        format.json { render :json => @hollyday.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hollydays/1
  # PUT /hollydays/1.json
  def update
    @hollyday = Hollyday.find(params[:id])

    respond_to do |format|
      if @hollyday.update_attributes(params[:hollyday])
        format.html { redirect_to @hollyday, :notice => 'Hollyday was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @hollyday.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hollydays/1
  # DELETE /hollydays/1.json
  def destroy
    @hollyday = Hollyday.find(params[:id])
    @hollyday.destroy

    respond_to do |format|
      format.html { redirect_to hollydays_url }
      format.json { head :no_content }
    end
  end
end
