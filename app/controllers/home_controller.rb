#encoding: utf-8
class HomeController < ApplicationController
  #caches_page :index, :us, :chrome
  #cache_sweeper :home_sweeper
  before_filter :authenticate_user!

  def index
  end

  def sms
  end

  def email
  end
  

end
