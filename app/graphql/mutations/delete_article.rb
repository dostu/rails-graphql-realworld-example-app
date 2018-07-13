class Mutations::DeleteArticle < Mutations::Base
  argument :id, ID, required: true

  field :article, Types::ArticleType, null: false

  def resolve(id:)
    current_user = ensure_current_user
    article = current_user.articles.find(id)
    article.destroy!
    { article: article }
  end
end
