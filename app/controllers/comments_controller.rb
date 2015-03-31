class CommentsController < ApplicationController
  def create
    @hash_tag = Tag.all
    @test=''
    @user = User.where(:id => current_user.id)
    @image_date = ImageDate.find(params[:image_date_id])
    @comment = @image_date.comments.create(comment_params)
    @tags = @comment.hsh.split
    @tags.each do |tag|
      if tag[0].eql?('#')
        Tag.create(:name => tag, :comment_id => @comment.id)
      else
        Tag.create(:name => ('#'+tag), :comment_id => @comment.id)
      end
    end
    respond_to do |format|
      format.html {redirect_to image_date_path(@image_date)}
      format.js
    end
  end

  def destroy
    @image_date = ImageDate.find(params[:image_date_id])
    @comment = @image_date.comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html {redirect_to image_date_path(@image_date)}
      format.js
    end

  end
  private
  def comment_params
    params.require(:comment).permit(:comment, :user_name, :user_id, :hsh)
  end

end
