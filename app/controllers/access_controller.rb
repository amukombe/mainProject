class AccessController < ApplicationController
  layout 'user'

  def index
  	menu
  	render 'menu'
  end

  def menu
  end

  def login
  end
  def attempt_login
  	authorized_user = Account.authenticate(params[:username], params[:password])
  	if authorized_user
  		session[:account_id] = authorized_user.id
  		session[:username] = authorized_user.username
  		session[:role_id] = authorized_user.role_id
  		session[:school_name] = authorized_user.school_name
  		if session[:role_id] == "Student"
  			redirect_to :controller=>'sessions',:action=>'studentmain'
  		else 
  			flash[:notice]="Invalid Username / Password"
  			redirect_to :controller=>'sessions', :action=>'login'
  		end
  	end
  end
end
