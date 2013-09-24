class ApplicationController < ActionController::Base
  protect_from_forgery


  protected
  def confirm_logged_in
  	unless session[:user_id]
      flash[:notice]="Please you must Login"
  		redirect_to :controller=>'sessions',:action=>'login'
  		return false
  	else
  		return true
  	end
  end
  def confirm_logged_in_admin
    unless session[:admin_id]
      flash[:notice]="you do not have enough previlleges"
      redirect_to :controller=>'sessions',:action=>'login'
      return false
    else
      return true
    end
  end

  def confirm_admin
    unless session[:role_id] && session[:role_id]=='Admin'
      flash[:notice]="you do not have enough previlleges"
      redirect_to :controller=>'sessions',:action=>'login'
      return false
    else
      return true
    end
  end
end
