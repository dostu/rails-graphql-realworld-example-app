class Mutations::UpdateUser < Mutations::Base
  argument :email, String, required: true
  argument :username, String, required: true
  argument :bio, String, required: false
  argument :image, String, required: false
  argument :password, String, required: false

  field :user, Types::UserType, null: true
  field :errors, [Types::UserErrorType], null: false

  def resolve(email:, username:, bio: nil, image: nil, password: nil)
    current_user = ensure_current_user

    current_user.assign_attributes(
      email: email,
      username: username,
      bio: bio,
      image: image
    )

    current_user.password = password if password.present?

    current_user.save

    {
      errors: user_errors(current_user.errors),
      user: current_user.reload
    }
  end
end
