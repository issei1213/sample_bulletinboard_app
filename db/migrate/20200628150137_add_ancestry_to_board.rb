class AddAncestryToBoard < ActiveRecord::Migration[5.2]
  def change
    add_reference :boards, :category, foreign_key: true
  end
end
