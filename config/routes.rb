Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match '/graphql', to: 'graphql#execute', via: [:get, :post]

  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
end
