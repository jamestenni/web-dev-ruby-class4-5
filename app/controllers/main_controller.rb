class MainController < ApplicationController
	before_action :set_user, only: %i[ user_main ]

  def login
  end

  def login_check
    #input: email and pass
    @user = User.find_by(email: params[:email], pass: params[:pass])
    @isExist = @user != nil

    puts "EMAIL = #{params[:email]}"
    puts "PASSWORD = #{params[:pass]}"
    puts "IS THIS USER EXIST? = #{@isExist}"

    if (!@isExist)
      #redirect_to main_url(login_failed: true)
      render 'login_failed'
    else
      redirect_to user_main_url(id: @user.id)
    end
  end

  def user_main
  	@user = User.find(params[:id])
  end

  private
  	def set_user
  		@user = User.find(params[:id])
    end


end
