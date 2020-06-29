# == Schema Information
#
# Table name: boards
#
#  id          :bigint           not null, primary key
#  content     :string(255)      default(""), not null
#  title       :string(255)      default(""), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint
#  user_id     :bigint
#
# Indexes
#
#  index_boards_on_category_id  (category_id)
#  index_boards_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class BoardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
