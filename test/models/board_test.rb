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
require 'test_helper'

class BoardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
