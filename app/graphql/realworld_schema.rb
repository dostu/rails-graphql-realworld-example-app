class RealworldSchema < GraphQL::Schema
  use GraphQL::Batch
  use GraphQL::Tracing::NewRelicTracing, set_transaction_name: true

  mutation(Types::MutationType)
  query(Types::QueryType)

  max_complexity 200
  max_depth 10
end
