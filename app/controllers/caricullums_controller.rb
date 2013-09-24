class CaricullumsController < ApplicationController
  # GET /caricullums
  # GET /caricullums.json
  layout 'admin'
  def index
    @caricullums = Caricullum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @caricullums }
    end
  end

  # GET /caricullums/1
  # GET /caricullums/1.json
  def show
    @caricullum = Caricullum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @caricullum }
    end
  end

  # GET /caricullums/new
  # GET /caricullums/new.json
  def new
    @caricullum = Caricullum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @caricullum }
    end
  end

  # GET /caricullums/1/edit
  def edit
    @caricullum = Caricullum.find(params[:id])
  end

  # POST /caricullums
  # POST /caricullums.json
  def create
    @caricullum = Caricullum.new(params[:caricullum])

    respond_to do |format|
      if @caricullum.save
        format.html { redirect_to @caricullum, notice: 'Caricullum was successfully created.' }
        format.json { render json: @caricullum, status: :created, location: @caricullum }
      else
        format.html { render action: "new" }
        format.json { render json: @caricullum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /caricullums/1
  # PUT /caricullums/1.json
  def update
    @caricullum = Caricullum.find(params[:id])

    respond_to do |format|
      if @caricullum.update_attributes(params[:caricullum])
        format.html { redirect_to @caricullum, notice: 'Caricullum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @caricullum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caricullums/1
  # DELETE /caricullums/1.json
  def destroy
    @caricullum = Caricullum.find(params[:id])
    @caricullum.destroy

    respond_to do |format|
      format.html { redirect_to caricullums_url }
      format.json { head :no_content }
    end
  end
end
