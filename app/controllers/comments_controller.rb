class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post
  before_action :set_comment, only: :destroy

  def create
    authorize_action_for Comment
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    respond_to do | format |
      format.js
    end
  end

  def destroy
    authorize_action_for @comment
    @comment.destroy
    respond_to do | format |
      format.js
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end