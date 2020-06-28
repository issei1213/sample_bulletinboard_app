require 'rails_helper'
RSpec.describe CommentsController, type: :controller do
  let(:user) { create(:user) }
  let(:board) { create(:board) }
  describe "POST create" do
    let(:comment) { create(:babysitter) }
    let(:comment_attributes){ attributes_for(:comment)}
    context "log in" do
      before do
        login user
        post :create, params: { board_id: board.id, comment: comment_attributes }
      end
      it "Viewに推移する事を確認" do
        comment = Comment.last
        expect(comment).to redirect_to(board_path(comment.board_id))
      end
      it "モデルの増減することを確認" do
        expect{ post :create, params: { board_id: board.id, comment: comment_attributes }}.to change(Comment, :count).by(1)
      end
    end
  end
end





