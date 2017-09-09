Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :users, !types[Types::UserType] do
    description "All users"
    resolve ->(_obj, _args, _ctx) {
      User.all
    }
  end

  field :user do
    type Types::UserType
    argument :email, !types.String
    description "Find a user by email"
    resolve ->(_obj, args, _ctx) {
      User.find_by_email(args["email"])
    }
  end
end
