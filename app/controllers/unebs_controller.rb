class UnebsController < ApplicationController
  # GET /unebs
  # GET /unebs.json
  layout 'admin'
  before_filter :confirm_logged_in
  
  def index
    @unebs = Uneb.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @unebs }
    end
  end

  # GET /unebs/1
  # GET /unebs/1.json
  def show
    @uneb = Uneb.find(params[:id])
    @subjects=Subject.all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @uneb }
    end
  end

  # GET /unebs/new
  # GET /unebs/new.json
  def new
    @uneb = Uneb.new
    @subjects=Subject.order('subjects.subjectname')
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @uneb }
    end
  end

  # GET /unebs/1/edit
  def edit
    @uneb = Uneb.find(params[:id])
    @subjects=Subject.all
  end
  def uploadFile
    post =DataFile.save(params[:upload])
    flash[:notice]="File has been successfully Uploaded"
     # render :text => "File has been successfully Uploaded"
  end
  # POST /unebs
  # POST /unebs.json
  def create
    @uneb = Uneb.new(params[:uneb])
    @subjects=Subject.all
    respond_to do |format|
      if @uneb.save
        format.html { redirect_to @uneb, notice: 'Uneb was successfully created.' }
        format.json { render json: @uneb, status: :created, location: @uneb }
      else
        format.html { render action: "new" }
        format.json { render json: @uneb.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /unebs/1
  # PUT /unebs/1.json
  def update
    @uneb = Uneb.find(params[:id])
    @subjects=Subject.all
    if @uneb.update_attributes(params[:unebs])
      flash[:notice]="paper successfully updated"
      redirect_to :action=>'index'
    else
      flash[:notice]="Failed to update"
      render :action=>'edit'
    end
  end

  # DELETE /unebs/1
  # DELETE /unebs/1.json
  def destroy
    @uneb = Uneb.find(params[:id])
    @uneb.destroy

    respond_to do |format|
      format.html { redirect_to unebs_url }
      format.json { head :no_content }
    end
  end
end
