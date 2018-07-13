class Mutations::DeleteComment < Mutations::Base
  argument :id, ID, required: true

  field :comment, Types::CommentType, null: true

  def resolve(id:)
    current_user = ensure_current_user
    comment = current_user.comments.find(id)
    comment.destroy!
    { comment: comment }
  end
end
