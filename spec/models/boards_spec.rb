require 'rails_helper'

RSpec.describe Board, type: :model do
  context "can save" do
    it "全カラムが存在すれば登録できる事" do
      board = build(:board)
      board.valid?
      expect(board).to be_valid
    end
  end

  context "can not save" do
    it "titleが空で登録できない事" do
      board = build(:board, title: "")
      board.valid?
      expect(board.errors[:title]).to include("を入力してください")
    end

    it "contentが空で登録できない事" do
      board = build(:board, title: "")
      board.valid?
      expect(board.errors[:title]).to include("を入力してください")
    end
  end
end