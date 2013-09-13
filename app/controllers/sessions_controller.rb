class SessionsController < ApplicationController
  layout 'admin'

  before_filter :confirm_logged_in, :except=>[:login, :create, :logout,:register]

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
  		redirect_to :controller=>'admin', :action=>'index'
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
    
  end

end
