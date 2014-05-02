class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  #before_filter :authenticate_user!

  # GET /posts
  # GET /posts.json
  def index
    if params[:beacon_id].present? 
      @posts = Post.where("beacon_id = ?", params[:beacon_id])
    else 
      @posts = Post.all
    end  
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    @post.user_id = current_user.id
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  def tagged
    if params[:tag].present? 
      @posts = Post.tagged_with(params[:tag])
    else 
      @posts = Post.all
    end  
  end

  def favorited
    if !params[:user_id].present? 
      params[:user_id] = current_user.id
    end  
    #@posts = Post.tagged_with(params[:tag])
    # maybe try @posts = Post.favorited_by(params[:user_id])
    @posts = Array.new()
    u = User.find(params[:user_id])
    f = u.favorites
    f.each do |favorite|
      @posts << Post.find(favorite.favorable_id)
    end
  end


  # this doesn't belong here but it's a quick hack
  def get_user
    if !params[:user_id].present? 
      params[:user_id] = current_user.id
    end  
    @user = User.find(params[:user_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:email, :timestamp, :likes, :title, :event_date, :body_text, :media, :tag_list, :beacon_id)
    end
end
