class BoardsController < ApplicationController
  before_action :move_to_root, only: [:new]

  def index
    @boards = Board.page(params[:page]).per(8)
  end

  def show
    @board = Board.find(params[:id])
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save!
      redirect_to @board, notice: "登録しました。"
    else
      flash[:error_messages] = @board.errors.full_messages
      render :new
    end
  end

  private

  def board_params
    params.require(:board).permit(:title, :content, :tag_list).merge(user_id: current_user.id)
  end

  def move_to_root
    unless user_signed_in?
      redirect_to root_path, notice: "ログインユーザーのみ投稿できます"
    end
  end
end
