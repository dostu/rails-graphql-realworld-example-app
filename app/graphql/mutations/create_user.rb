class Mutations::CreateUser < Mutations::Base
  argument :username, String, required: true
  argument :email, String, required: true
  argument :password, String, required: true

  field :user, Types::ViewerType, null: true
  field :errors, [Types::UserErrorType], null: false

  def resolve(username:, email:, password:)
    user = User.create(
      username: username,
      email: email,
      password: password
    )

    {
      errors: user_errors(user.errors),
      user: user.valid? ? user : nil
    }
  end
end
