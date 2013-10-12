class AdminController < ApplicationController
  before_filter :confirm_logged_in
  before_filter :confirm_admin
  #before_filter :confirm_logged_in_admin
  layout 'admin'

  def index
    @admin = Admin.all
  end 

end
