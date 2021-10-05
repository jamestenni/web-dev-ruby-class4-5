class MainController < ApplicationController
	before_action :set_user, only: %i[ user_main ]
  before_action :logged_in2, only: %i[ user_main ]

  def login
  end

  def login_check
    #input: email and pass
    @user = User.find_by(email: params[:email])
    @isExist = @user != nil

    if (!@isExist || !@user.authenticate(params[:password]))
      redirect_to main_path, notice: "Your Username or Password is incorrect!"
    else
      session[:user_id] = @user.id
      redirect_to user_main_path(id: @user.id), notice: "Login Successfully!"
    end
  end

  def user_main
  	@user = User.find(params[:id])
  end

  private
  	def set_user
  		@user = User.find(params[:id])
    end

    def logged_in2
      if (session[:user_id] == @user.id)
        return true
      else
        redirect_to main_path, notice: "Please Login!"
      end
    end

end
