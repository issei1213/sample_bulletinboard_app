# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  content    :string(255)      default(""), not null
#  title      :string(255)      default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Board < ApplicationRecord
  acts_as_taggable_on :tags

  default_scope -> { order(created_at: :desc) }

  validates :title, :content, presence: true
end
