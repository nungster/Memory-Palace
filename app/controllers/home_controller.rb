class HomeController < ApplicationController

  #before_filter :authenticate_user!

  def index
    #@events = current_user.events.all
  end

  def validate
    logger.info(params[:password].inspect)
    User.authenticate(params[:login],params[:password])
  end
end
