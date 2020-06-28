require 'rails_helper'

RSpec.describe Comment, type: :model do
  context "can save" do
    it "全カラムが存在すれば登録できる事" do
      comemnt = build(:comment)
      comemnt.valid?
      expect(comemnt).to be_valid
    end
  end

  context "can not save" do
    it "commentが空で登録できない事" do
      comment = build(:comment, comment: "")
      comment.valid?
      expect(comment.errors[:comment]).to include("を入力してください")
    end
  end
end