class GraphqlController < ApplicationController
  include Knock::Authenticable

  def execute
    result = RealworldSchema.execute(
      params[:query],
      operation_name: params[:operationName],
      variables: ensure_hash(params[:variables]),
      context: context
    )

    render json: result
  end

  private

  def context
    { current_user: current_user }
  end

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end
end
