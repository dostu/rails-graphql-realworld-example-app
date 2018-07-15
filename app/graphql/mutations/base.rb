class Mutations::Base < GraphQL::Schema::RelayClassicMutation
  def user_errors(errors)
    errors.full_messages.map { |error| UserError.new(error) }
  end

  def ensure_current_user
    current_user = context[:current_user]
    raise GraphQL::ExecutionError, 'Not authorized' unless current_user
    current_user
  end
end
