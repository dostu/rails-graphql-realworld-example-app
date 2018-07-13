class Mutations::CreateArticle < Mutations::Base
  argument :title, String, required: true
  argument :description, String, required: true
  argument :body, String, required: true
  argument :tagList, [String], required: true, as: :tag_list

  field :article, Types::ArticleType, null: true
  field :errors, [Types::UserErrorType], null: false

  def resolve(title:, description:, body:, tag_list:)
    current_user = ensure_current_user

    article = current_user.articles.create(
      title: title,
      description: description,
      body: body,
      tag_list: tag_list
    )

    {
      errors: user_errors(article.errors),
      article: article.valid? ? article : nil
    }
  end
end
