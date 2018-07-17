class Types::UserEdgeType < GraphQL::Types::Relay::BaseEdge
  node_type(Types::UserType)
end
