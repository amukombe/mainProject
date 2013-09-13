class AdminController < ApplicationController
  before_filter :confirm_logged_in
  layout 'admin'

  def index
    @admin = Admin.all
  end 

end
