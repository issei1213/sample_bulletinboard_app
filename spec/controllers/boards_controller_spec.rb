require 'rails_helper'
RSpec.describe BoardsController, type: :controller do
  let(:user) { create(:user) }

  describe "GET index" do
    let(:boards) { create_list(:board, 2) }
    before { get :index, params: {}, session: {} }

    it "HTTPステータスが200であることを確認" do
      expect(response.status).to eq(200)
    end

    it "インスタンス変数の値を確認" do
      expect(assigns (:boards)).to eq boards
    end

    it "Viewに推移する事を確認" do
      expect(response).to render_template :index
    end
  end

  describe "GET show" do
    let(:board) { create(:board) }
    before { get :show, params: { id: board.id }, session: {} }

    it "HTTPステータスが200であることを確認" do
      expect(response.status).to eq(200)
    end

    it "インスタンス変数の値を確認" do
      expect(assigns(:board)).to eq board
    end

    it "Viewに推移する事を確認" do
      expect(response).to render_template :show
    end
  end

  describe "GET new" do
    
    context "log in" do
      before do
        login user
        get :new, params: {}, session: {} 
      end

      it "HTTPステータスが200であることを確認" do
        expect(response.status).to eq(200)
      end

      it "インスタンス変数の値を確認" do
        expect(assigns(:board)).to be_a_new(Board)
      end

      it "Viewに推移する事を確認" do
        expect(response).to render_template :new
      end
    end
    context "not log in" do
      before do
        get :new, params: {}, session: {} 
      end
      it "Viewに推移する事を確認" do
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "POST create" do
    let(:board) { create(:board) }
    let(:board_attributes){ attributes_for(:board)}
    before do
      login user
      post :create, params: { user_id: user.id, board: board_attributes }
    end
    it "Viewに推移する事を確認" do
      board = Board.last
      expect(board).to redirect_to(board_path(board.id))
    end
    it "モデルの増減することを確認" do
      expect{ post :create, params: { user_id: user.id, board: board_attributes }}.to change(Board, :count).by(1)
    end
  end
end
