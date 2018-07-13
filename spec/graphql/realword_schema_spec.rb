require 'rails_helper'

describe RealworldSchema do
  def execute_graphql_query(query, variables = {}, context = {})
    result = RealworldSchema.execute(
      query,
      variables: variables,
      context: context
    )

    pp result if result['errors']

    result
  end

  it 'contains latest changes' do
    current_defn = RealworldSchema.to_definition
    printout_defn = File.read(Rails.root.join('app', 'graphql', 'schema.graphql'))
    expect(current_defn).to eq(printout_defn), 'Update the printed schema with `bundle exec rails dump_schema`'
  end

  describe 'feed' do
    it 'is works' do
      create :article, author: create(:user)
      result = execute_graphql_query('{ articles { edges { node { title } } } }')
      expect(result.dig('data', 'articles', 'edges').first['node']).to eq('title' => 'Title')
    end
  end
end
