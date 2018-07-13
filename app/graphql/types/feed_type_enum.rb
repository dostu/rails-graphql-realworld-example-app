class Types::FeedTypeEnum < GraphQL::Schema::Enum
  graphql_name 'FeedType'

  value 'YOUR'
  value 'GLOBAL'
  value 'TAG'
end
