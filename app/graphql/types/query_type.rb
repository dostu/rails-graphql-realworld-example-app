class Types::QueryType < GraphQL::Schema::Object
  field :viewer, Types::ViewerType, null: true
  def viewer
    context[:current_user]
  end

  field :user, Types::UserType, null: true do
    argument :username, String, required: true
  end
  def user(username:)
    User.find_by(username: username)
  end

  field :articles, Types::ArticleType.connection_type, null: false do
    argument :tag, String, required: false
    argument :authoredBy, String, required: false, as: :authored_by
    argument :favoritedBy, String, required: false, as: :favorited_by
  end
  def articles(tag: nil, authored_by: nil, favorited_by: nil)
    articles = Article.all

    if authored_by.present?
      author = User.find_by(username: authored_by)
      raise GraphQL::ExecutionError, 'User not found' if author.blank?
      articles.where!(author: author)
    end

    if favorited_by.present?
      user = User.find_by(username: favorited_by)
      raise GraphQL::ExecutionError, 'User not found' if user.blank?
      articles.where!(id: user.favorite_article_ids)
    end

    if tag.present?
      articles = articles.tagged_with(tag)
    end

    articles.order(id: :desc)
  end

  field :article, Types::ArticleType, null: true do
    argument :slug, String, required: true
  end
  def article(slug:)
    Article.friendly.find(slug)
  end

  field :tags, [String], null: false
  def tags
    ActsAsTaggableOn::Tag.most_used.pluck(:name)
  end
end
