class CommentsController < ApplicationController
  def create
    @listing = Listing.find(params[:listing_id])
    @comment = @listing.comments.create(comment_params)
    redirect_to listing_path(@listing)
  end

  private
    def comment_params
        params.require(:comment).permit(:listing_id, :comment, :body)
    end
end
