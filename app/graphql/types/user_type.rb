Types::UserType = GraphQL::ObjectType.define do
  name 'User'
  description "A user who is able to sign."

  field :id, !types.ID
  field :email, !types.String
  field :username, !types.String
end
