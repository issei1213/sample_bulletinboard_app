# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  content    :string(255)      default(""), not null
#  title      :string(255)      default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_boards_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Board < ApplicationRecord
  belongs_to :user
  has_many :comments
  acts_as_taggable_on :tags

  default_scope -> { order(created_at: :desc) }

  validates :title, :content, presence: true

end
