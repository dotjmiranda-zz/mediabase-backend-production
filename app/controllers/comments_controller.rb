class CommentsController < ApplicationController
  def create
    @user = User.find(params[:user_id])

    @comment = Comment.create!(
        post_id: params[:id],
        user_id: params[:user_id],
        username: params[:username],
        content: params[:content]
    )

    @comment.post.update!(
        last_comment_user: @user.username,
        last_comment_time: @comment.updated_at
    )
  end

  def destroy
    Comment.find(params[:id]).destroy!
  end
end