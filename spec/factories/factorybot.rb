FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(8)
    nickname                { Gimei.last.romaji }
    email                   { Faker::Internet.email }
    password                { password }
    password_confirmation   { password }
  end

  factory :board do
    user
    title                   { "テストタイトル" }
    content                 { "テスト本文 "}
  end

  factory :comment do
    user
    board
    comment                 { "テストコメント" }
  end
end 