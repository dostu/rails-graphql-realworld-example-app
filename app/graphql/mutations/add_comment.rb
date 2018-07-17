class Mutations::AddComment < Mutations::Base
  argument :article_id, ID, required: true
  argument :body, String, required: true

  field :comment, Types::CommentType, null: true
  field :errors, [Types::UserErrorType], null: false

  def resolve(article_id:, body:)
    current_user = context[:current_user]
    article = Article.find(article_id)

    comment = current_user.comments.create(
      article: article,
      body: body
    )

    {
      errors: user_errors(comment.errors),
      comment: comment.valid? ? comment : nil
    }
  end
end
