class CommentsController < ApplicationController
  def create
    @user = User.where(:id => current_user.id)
    @image_date = ImageDate.find(params[:image_date_id])
    @comment = @image_date.comments.create(comment_params)
    respond_to do |format|
      format.html {redirect_to image_date_path(@image_date)}
      format.js
    end
  end

  def destroy
    @image_date = ImageDate.find(params[:image_date_id])
    @comment = @image_date.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html {redirect_to image_date_path(@image_date)}
      format.js
    end

  end
  private
  def comment_params
    params.require(:comment).permit(:comment, :user_name, :user_id)
  end
end
