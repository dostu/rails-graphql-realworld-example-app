class Types::UserType < GraphQL::Schema::Object
  graphql_name 'User'

  field :id, ID, null: false
  field :username, String, null: false
  field :email, String, null: false
  field :image, String, null: true
  field :bio, String, null: true
end
