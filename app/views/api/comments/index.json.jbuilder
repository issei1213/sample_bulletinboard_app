json.array! @comments do |comment|
  json.id Comment.where(board_id: comment.board_id).count
  json.user_nickname comment.user.nickname
  json.created_at l comment.created_at
  json.comment simple_format(comment.comment)
  json.custom_id comment.id
end