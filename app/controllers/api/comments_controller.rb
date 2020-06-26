class Api::CommentsController < ApplicationController
  def index
    board = Board.find(params[:board_id])
    last_comment_id = params[:id].to_i
    @comments = board.comments.where("id > ?", last_comment_id)
  end
end