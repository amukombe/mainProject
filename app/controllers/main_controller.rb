class MainController < ApplicationController
  layout 'main'
  #before_filter :confirm_logged_in
  def index
  	render 'home'
  end
  def home
  end

  def aboutus
  end

  def contactus
  end

  def schools
    @school = School.order('schools.schoolname ASC')
  end
end
