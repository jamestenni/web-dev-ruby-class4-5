class MainController < ApplicationController
	before_action :set_user, only: %i[ user_main ]

  def login
  	@login_failed = params.has_key?("login_failed") && params[:login_failed] == "true"
  end

  def user_main
  	@user = User.find(params[:id])
  end

  private
  	def set_user
  		@user = User.find(params[:id])
    end


end
