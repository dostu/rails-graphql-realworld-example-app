require 'rails_helper'

describe Mutations::CreateUser do
  def perform(args = {})
    described_class.new(object: nil, context: {}).resolve(args)
  end

  it 'creates a new user' do
    result = perform(
      username: 'Test User',
      email: 'email@example.com',
      password: '[omitted]'
    )

    user = result[:user]

    expect(user).to be_persisted
    expect(user.username).to eq('Test User')
    expect(user.email).to eq('email@example.com')
  end
end
