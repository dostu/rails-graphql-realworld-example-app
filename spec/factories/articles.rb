FactoryBot.define do
  factory :article do
    title { 'Title' }
    description { 'Description' }
    body { 'Body' }
    tag_list { %w[tag1 tag2] }
  end
end
