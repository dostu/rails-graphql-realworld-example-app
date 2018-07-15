class Types::FollowerEdgeType < GraphQL::Types::Relay::BaseEdge
  node_type(Types::ProfileType)
end

class Types::FollowersConnectionType < GraphQL::Types::Relay::BaseConnection
  edge_type(Types::FollowerEdgeType)

  field :total_count, Integer, null: false
  def total_count
    object.nodes.size
  end
end
