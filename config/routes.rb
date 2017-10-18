Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/"
  end

  root to: "graphql#execute"
  post "/", to: "graphql#execute"
end
