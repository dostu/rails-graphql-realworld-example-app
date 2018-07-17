Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/graphql', to: 'graphql#execute'

  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
end
