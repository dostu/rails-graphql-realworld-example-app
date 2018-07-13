class Types::ProfileType < GraphQL::Schema::Object
  graphql_name 'Profile'

  field :id, ID, null: false
  field :username, String, null: false
  field :email, String, null: false
  field :image, String, null: true
  field :bio, String, null: true
  field :following, Boolean, null: false
  field :followersCount, Int, null: false, method: :follows_count

  def following
    current_user = context[:current_user]
    return false unless current_user
    current_user.followees.exists?(object.id)
  end
end
