require 'rails_helper'

RSpec.describe User, type: :model do
  context "can save" do
    it "全カラムが存在すれば登録できる事" do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
    end

    it "パスワードが8文字以上で登録できる事" do
      user = build(:user, password: "aaaa1111", password_confirmation: "aaaa1111")
      user.valid?
      expect(user).to be_valid
    end

    it "正しいアドレスで登録できる事" do
      user = build(:user, email: "test@gmail.com")
      user.valid?
      expect(user).to be_valid
    end
  end

  context "can not save" do

    it "emailが空で登録できない事" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "emailが不正なアドレスで登録できない事" do
      user = build(:user, email: "test@test")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "nicknameが空で登録できない事" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "passwordが空で登録できない事" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "password_confirmationが空で登録できない事" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("を入力してください")
    end

    it "passwordとpassword_confirmationが不一致で登録できない事" do
      user = build(:user, password: "aaaa1111", password_confirmation: "bbbb2222")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "passwordが7文字以下で登録できない事" do
      user = build(:user, password: "passwor")
      user.valid?
      expect(user.errors[:password]).to include("は8文字以上で入力してください")
    end

    it "password_confirmationが7文字以下で登録できない事" do
      user = build(:user, password_confirmation: "passwor")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("は8文字以上で入力してください")
    end
  end
end