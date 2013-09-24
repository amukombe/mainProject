class SessionsController < ApplicationController
  layout 'admin'

  before_filter :confirm_logged_in, :except=>[:login, :create, :logout, :register, :activate]

  def login
  end
  def menu
  	
  end

  def create
  	if user=User.authenticate(params[:username], params[:password])
  		session[:user_id] = user.id
      session[:username] = user.username
      session[:firstname] = user.firstname
      session[:lastname] = user.lastname
      session[:role_id] = user.role_id
        if session[:role_id] == 'Admin'
  		    redirect_to :controller=>'admin', :action=>'index'
        else if session[:role_id] == 'Teacher'
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
  	else
  		flash[:notice]="Invalid Username / Password"
  		redirect_to :controller=>'sessions', :action=>'login'
  	end
  end

  def logout
  	session[:user_id] = nil
    session[:username] = nil
    session[:firstname] = nil
    session[:lastname] = nil
  	flash[:notice]="You are logged out" 	
  	redirect_to :action=>'login'
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
