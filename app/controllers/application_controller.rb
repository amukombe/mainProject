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
end
