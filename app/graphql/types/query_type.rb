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
  end
  def articles(tag: nil, authored_by: nil, favorited_by: nil)
    articles = Article.all

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
