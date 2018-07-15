class Types::ViewerType < GraphQL::Schema::Object
  graphql_name 'Viewer'

  field :profile, Types::ProfileType, null: false
  def profile
    object
  end

  field :feed, Types::ArticleType.connection_type, null: false
  def feed
    Article.where(author: object.followees).order(id: :desc)
  end
end
