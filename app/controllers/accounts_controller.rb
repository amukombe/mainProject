class AccountsController < ApplicationController
  layout 'admin'
  
  before_filter :confirm_logged_in, :except=>[:new, :create]
  before_filter :confirm_admin, :except=>[:new, :create, :edit, :update]
  def index
    @accounts = Account.order('accounts.school_name ASC')
  end

  def new
  	@accounts = Account.new
  	@schools=School.order('schools.schoolname ASC')
  end

  def create
  	@accounts = Account.new(params[:accounts])
    @schools = School.all
    #@students = Student.all
    #available_student=Student.validate_student(params[:student_no], params[:school_name])
    available_student=Student.find_by_student_number(params[:student_no], params[:school_name])
    respond_to do |format|
  	if available_student
      if @accounts.save
    		flash[:notice]="Account successfully activated"
    		format.html{redirect_to :controller=>'sessions', :action=>'login'}
    	else
        format.html{render :action=>'new'}
    		format.json{render json: @accounts.errors, status: :unprocessable_entity}
    	end
    else
        flash[:notice]="Invalid student number / school"
        format.html{redirect_to :action=>'new'}
        format.json{render json: @accounts.errors, status: :unprocessable_entity}
    end
  end
  end

  def edit
    @accounts = Account.find(params[:id])
    @schools=School.order('schools.schoolname ASC')
  end

  def update
    @accounts = Account.find(params[:id])
    @schools=School.all
    if @accounts.update_attributes(params[:accounts])
      flash[:notice] = "Account successfully activated"
      redirect_to :action=>'index'
    else
      render 'edit'
    end
  end

  def show
    @account = Account.find(params[:id])

  end
end
