class Types::MutationType < GraphQL::Schema::Object
  field :createUser, mutation: Mutations::CreateUser
  field :updateUser, mutation: Mutations::UpdateUser
  field :signInUser, mutation: Mutations::SignInUser
  field :followUser, mutation: Mutations::FollowUser
  field :unfollowUser, mutation: Mutations::UnfollowUser

  field :createArticle, mutation: Mutations::CreateArticle
  field :updateArticle, mutation: Mutations::UpdateArticle
  field :deleteArticle, mutation: Mutations::DeleteArticle
  field :favoriteArticle, mutation: Mutations::FavoriteArticle
  field :unfavoriteArticle, mutation: Mutations::UnfavoriteArticle

  field :addComment, mutation: Mutations::AddComment
  field :deleteComment, mutation: Mutations::DeleteComment
end
