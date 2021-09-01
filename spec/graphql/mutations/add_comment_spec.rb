require 'rails_helper'

describe Mutations::AddComment do
  let!(:user) { create :user }
  let!(:article) { create :article, author: user }

  def perform(args = {})
    described_class.new(object: nil, field: nil, context: { current_user: user }).resolve(args)
  end

  it 'adds a comment to an article' do
    result = perform(
      article_id: article.id,
      body: 'Comment'
    )

    expect(result[:errors]).to be_empty
    expect(result[:comment]).to have_attributes(body: 'Comment')
  end

  it 'returns errors' do
    result = perform(
      article_id: article.id,
      body: ' '
    )

    expect(result[:errors]).to eq([UserError.new("Body can't be blank")])
    expect(result[:comment]).to be_nil
  end
end
