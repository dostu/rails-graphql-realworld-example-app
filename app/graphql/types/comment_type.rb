class Types::CommentType < GraphQL::Schema::Object
  graphql_name 'Comment'

  field :id, ID, null: false
  field :createdAt, Types::DateTimeType, null: false, method: :created_at
  field :updatedAt, Types::DateTimeType, null: false, method: :updated_at
  field :body, String, null: false
  field :author, Types::ProfileType, null: false

  def author
    Loaders::RecordLoader.for(User).load(object.author_id)
  end
end
