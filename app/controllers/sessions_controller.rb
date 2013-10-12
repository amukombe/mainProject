class SessionsController < ApplicationController
  layout 'admin'

  before_filter :confirm_logged_in, :except=>[:login, :create, :logout, :register, :activate]

  
  def login
    redirect_to :controller=>'access', :action=>'login'
  end
  def menu
  	
  end

  def create
    authorized_user = User.authenticate(params[:username], params[:password])
    authorized_student = Account.authenticate(params[:username], params[:password])
  	if authorized_user
  		session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      session[:firstname] = authorized_user.firstname
      session[:lastname] = authorized_user.lastname
      session[:role_id] = authorized_user.role_id

        if session[:role_id] == 'Admin'
  		    redirect_to :controller=>'admin', :action=>'index'
        else if session[:role_id] == 'Teacher'
          @teacher = Teacher.find_by_role_id(authorized_user.role_id)
          session[:school] = @teacher.school
          redirect_to :controller=> 'sessions', :action=> 'teachermain'
        else if session[:role_id] == 'Facilitator'
          redirect_to :controller=>'sessions', :action=>'facilitatormain'
        else if session[:role_id] == 'Student'
          redirect_to :controller=>'sessions',:action=>'studentmain'
        else if session[:role_id]== 'Entrant'
          redirect_to :controller=>'',:action=>''
        else
          redirect_to :controller=>'main',:action=>'home'
        end end end end end
    elsif authorized_student
      session[:role_id] = authorized_student.role_id
      session[:account_id] = authorized_student.id
      @student = Student.find_by_student_school(authorized_student.school_name)
      session[:firstname] = @student.firstname
      session[:lastname] = @student.lastname
      redirect_to :controller=>'sessions',:action=>'studentmain'
  	else
  		flash[:notice]="Invalid Username / Password"
  		redirect_to :controller=>'access', :action=>'login'
  	end
  end

  def logout
  	session[:user_id] = nil
    session[:account_id] = nil
    session[:username] = nil
    session[:firstname] = nil
    session[:lastname] = nil
  	flash[:notice]="You are logged out" 	
  	redirect_to :controller=>'access', :action=>'menu'
  end
  def register
    @user=User.new
    @schools=School.all
  end
  def activate
    @user = User.new(params[:user])
    @schools=School.all
      if @user.save
        redirect_to :action=>'login'
      else
        flash[:notice]='Failed to activate account. Please try again later'
        redirect_to :action=>'register'
      end
  end

end
