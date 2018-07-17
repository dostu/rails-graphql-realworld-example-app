class Types::FollowersConnectionType < GraphQL::Types::Relay::BaseConnection
  edge_type(Types::UserEdgeType)

  field :total_count, Integer, null: false
  def total_count
    object.nodes.size
  end
end
