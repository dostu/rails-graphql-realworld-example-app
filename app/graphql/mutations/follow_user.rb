class Mutations::FollowUser < Mutations::Base
  argument :id, ID, required: true

  field :user, Types::UserType, null: true

  def resolve(id:)
    current_user = ensure_current_user
    followee = User.find(id)
    current_user.followees << followee
    { user: followee.reload }
  end
end
