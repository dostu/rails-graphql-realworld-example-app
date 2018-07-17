class Types::UserType < GraphQL::Schema::Object
  graphql_name 'User'

  field :id, ID, null: false
  field :username, String, null: false
  field :email, String, null: false
  field :image, String, null: true
  field :bio, String, null: true
  field :followed_by_viewer, Boolean, null: false
  field :followers, Types::FollowersConnectionType, null: false, connection: true
  field :articles, Types::ArticleType.connection_type, null: false
  field :favorite_articles, Types::ArticleType.connection_type, null: false

  def followed_by_viewer
    current_user = context[:current_user]
    return false unless current_user
    current_user.followees.exists?(object.id)
  end
end
