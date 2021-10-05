class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :logged_in, except: %i[ new ]
  before_action :logged_in2, only: %i[ edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  def edit2
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
  end

  def edit2_s
    @post = Post.find(params[:post_id])
    @post.msg = params[:msg]

    respond_to do |format|
    if @post.save 
        format.html { redirect_to user_main_path(id: params[:user_id]), notice: "Post was successfully edited." }
    else
        format.html { redirect_to user_edit_post_path(user_id: params[:user_id], post_id: params[:post_id]), notice: "LOL" }
      end
    end
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_post
    @user = User.find(params[:id])
  end

  def create_post_s
    @post = Post.new()
    @post.user_id = params[:id]
    @post.msg = params[:msg]

    respond_to do |format|
    if @post.save 
        format.html { redirect_to user_main_path(id: @post.user_id), notice: "Post was successfully created." }
    else
        format.html { redirect_to user_create_post_path(id: @post.user_id), alert: "LOL" }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def destroy2
    @post = Post.find(params[:post_id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to user_main_path(id: params[:user_id]), notice: "Post was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:msg, :user_id)
    end

    def logged_in
      if (session[:user_id])
        return true
      else
        redirect_to main_path, notice: "Please Login!"
      end
    end

    def logged_in2
      if (session[:user_id] == @user.id)
        return true
      else
        redirect_to main_path, notice: "Please Login!"
      end
    end
end
