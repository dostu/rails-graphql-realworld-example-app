class Types::ArticleType < GraphQL::Schema::Object
  graphql_name 'Article'

  field :id, ID, null: false
  field :slug, String, null: false, method: :friendly_id
  field :title, String, null: false
  field :description, String, null: false
  field :body, String, null: false
  field :tag_list, [String], null: false
  field :created_at, Types::DateTimeType, null: false
  field :updated_at, Types::DateTimeType, null: false
  field :viewer_has_favorited, Boolean, null: false
  field :favorites_count, Int, null: false
  field :author, Types::UserType, null: true
  field :comments, [Types::CommentType], null: false

  def viewer_has_favorited
    current_user = context[:current_user]
    return false unless current_user
    Loaders::FavoritesLoader.for(current_user).load(object.id)
  end

  def author
    Loaders::RecordLoader.for(User).load(object.author_id)
  end

  def comments
    object.comments.order(id: :desc)
  end
end
