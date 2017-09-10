Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :users, !types[Types::UserType] do
    description "All users"
    resolve ->(_obj, _args, _ctx) {
      User.all
    }
  end

  field :user do
    type Types::UserType
    argument :username, !types.String
    description "Find a user by username"
    resolve ->(_obj, args, _ctx) {
      User.find_by_username(args["username"])
    }
  end
end
