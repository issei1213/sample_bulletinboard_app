class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to board_path(params[:board_id]), notice: 'メッセージが送信されました'  }
        format.json
      end
    else
      flash[:error_messages] = @comment.errors.full_messages
      redirect_to board_path(params[:board_id])
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, board_id: params[:board_id])
  end
end
