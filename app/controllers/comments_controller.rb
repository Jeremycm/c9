class CommentsController < ApplicationController
  before_filter :authenticate_user!
    def create
        @photo = Photo.find(params[:photo_id])
        @comment = @photo.comments.create(comment_params)
        redirect_to photo_path(@photo)
    end
    def destroy
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.find(params[:id])
    @comment.destroy
    redirect_to photo_path(@photo)
      
    end
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
