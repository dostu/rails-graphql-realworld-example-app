class Types::QueryType < GraphQL::Schema::Object
  field :me, Types::UserType, null: true
  def me
    context[:current_user]
  end

  field :profile, Types::ProfileType, null: true do
    argument :username, String, required: true
  end
  def profile(username:)
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

  field :feed, Types::ArticleType.connection_type, null: false
  def feed
    raise GraphQL::ExecutionError, 'Not authorized' unless current_user
    Article.where(author: current_user.followees).order(id: :desc)
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
