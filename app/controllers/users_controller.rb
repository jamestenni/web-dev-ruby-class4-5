class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save #SAVE COMPLETE
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    # @user.destroy
    # respond_to do |format|
    #   format.html { redirect_to users_url, notice: "User was successfully destroyed." }
    #   format.json { head :no_content }
    # end

    #IN-CLASS EXERCISE
    @u = @user.destroy
  end

  def create_fast
    @user = User.new()
    @user.name = params[:name]
    @user.email = params[:email]
    @user.pass = params[:pass]
    @user.birthday = params[:birthday]
    @user.address = params[:address]
    @user.postal_code = params[:postal_code]

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      end
    end
  end


  def login
    #input: email and pass
    @user = User.find_by(email: params[:email], pass: params[:pass])
    @isExist = @user != nil

    puts "EMAIL = #{params[:email]}"
    puts "PASSWORD = #{params[:pass]}"
    puts "IS THIS USER EXIST? = #{@isExist}"

    if (!@isExist)
      redirect_to main_url(login_failed: true)
    else
      redirect_to user_main_url(id: @user.id)
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :pass, :name, :birthday, :address, :postal_code)
    end
end
