require 'rails_helper'

describe Mutations::CreateArticle do
  let!(:user) { create :user }

  def perform(args = {})
    described_class.new(object: nil, field: nil, context: { current_user: user }).resolve(args)
  end

  it 'creates a new article' do
    result = perform(
      title: 'Title',
      description: 'Description',
      body: 'Body',
      tag_list: %w[tag1 tag2]
    )

    expect(result[:errors]).to be_empty
    expect(result[:article]).to have_attributes(
      title: 'Title',
      description: 'Description',
      body: 'Body',
      tag_list: %w[tag1 tag2]
    )
  end

  it 'returns errors' do
    result = perform(
      title: 'Title',
      description: 'Description',
      body: ' ',
      tag_list: %w[tag1 tag2]
    )

    expect(result[:errors]).to eq([UserError.new("Body can't be blank")])
    expect(result[:article]).to be_nil
  end
end
