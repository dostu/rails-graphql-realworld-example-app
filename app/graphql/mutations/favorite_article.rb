class Mutations::FavoriteArticle < Mutations::Base
  argument :id, ID, required: true

  field :article, Types::ArticleType, null: true

  def resolve(id:)
    current_user = ensure_current_user
    article = Article.find(id)
    current_user.favorite_articles << article
    { article: article.reload }
  end
end
