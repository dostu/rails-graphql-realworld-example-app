class Mutations::SignInUser < Mutations::Base
  argument :email, String, required: true
  argument :password, String, required: true

  field :token, String, null: true
  field :user, Types::ViewerType, null: true
  field :errors, [Types::UserErrorType], null: false

  def resolve(email:, password:)
    user = authenticate_user(email, password)

    unless user
      return {
        errors: [UserError.new('email or password is invalid')]
      }
    end

    token = Knock::AuthToken.new(payload: { sub: user.id }).token

    {
      user: user,
      token: token,
      errors: []
    }
  end

  private

  def authenticate_user(email, password)
    return if email.blank? || password.blank?

    user = User.find_by(email: email)
    return unless user
    return unless user.authenticate(password)

    user
  end
end
