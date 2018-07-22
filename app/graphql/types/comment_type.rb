class Types::CommentType < GraphQL::Schema::Object
  graphql_name 'Comment'

  field :id, ID, null: false
  field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  field :body, String, null: false
  field :author, Types::UserType, null: true
  field :article, Types::ArticleType, null: true

  def author
    Loaders::RecordLoader.for(User).load(object.author_id)
  end
end
