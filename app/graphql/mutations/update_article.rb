class Mutations::UpdateArticle < Mutations::Base
  argument :id, ID, required: true
  argument :title, String, required: true
  argument :description, String, required: true
  argument :body, String, required: true
  argument :tag_list, [String], required: true

  field :article, Types::ArticleType, null: true
  field :errors, [Types::UserErrorType], null: false

  def resolve(id:, title:, description:, body:, tag_list:)
    current_user = ensure_current_user
    article = current_user.articles.find(id)

    article.update(
      title: title,
      description: description,
      body: body,
      tag_list: tag_list
    )

    {
      errors: user_errors(article.errors),
      article: article.reload
    }
  end
end
