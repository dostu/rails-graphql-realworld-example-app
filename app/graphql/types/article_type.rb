class Types::ArticleType < GraphQL::Schema::Object
  graphql_name 'Article'

  field :id, ID, null: false
  field :slug, String, null: false, method: :friendly_id
  field :title, String, null: false
  field :description, String, null: false
  field :body, String, null: false
  field :tagList, [String], null: false, method: :tag_list
  field :createdAt, Types::DateTimeType, null: false, method: :created_at
  field :updatedAt, Types::DateTimeType, null: false, method: :updated_at
  field :favorited, Boolean, null: false
  field :favoritesCount, Int, null: false, method: :favorites_count
  field :author, Types::ProfileType, null: false
  field :comments, [Types::CommentType], null: false

  def favorited
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
