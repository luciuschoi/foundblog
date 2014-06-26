class PostsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_category
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  authorize_actions_for Post, only: [ :new, :create ]

  # GET /posts
  # GET /posts.json
  def index
    if @category
      @posts = @category.posts.published_posts
    else
      if params[:category_id] == '0'
        @posts = Post.uncategorized_posts
      else
        @posts = Post.published_posts
      end
    end
    @category_name = params[:category_id] == '0' ? "Uncategorized" : (@category ? @category.name : "")
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    authorize_action_for @post
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    authorize_action_for @post
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    authorize_action_for @post
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def list_my
    @myposts = Post.myposts(current_user)
  end

  private

    def set_category
      @category = Category.find(params[:category_id]) if params[:category_id] && params[:category_id] != '0'
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      if @category
        @post = @category.posts.find(params[:id])
      else
        @post = Post.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:category_id, :user_id, :title, :content, :published)
    end
end
