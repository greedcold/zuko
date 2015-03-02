class CommentsController < ApplicationController

def create
  @listing = Listing.find(params[:listing_id])
  @comment = @listing.comments.build(comment_params)
  if @comment.save
    @new_comment = @listing.comments.new
    respond_to do |format|
      format.html do
        flash[:success] = 'Your comment has been posted.'
        redirect_to @listing
        respond_with @comment if @comment.save
      end
      format.js
    end
  else
    @new_comment = @comment
    respond_to do |format|
      format.html { render @listing }
      format.js { render action: 'failed_save' }
    end
  end
end

  private
    def comment_params
        params.require(:comment).permit(:listing_id, :comment, :body)
    end
end
