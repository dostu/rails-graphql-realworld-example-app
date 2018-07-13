class Follow < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followee, class_name: 'User', counter_cache: true

  validates :followee, uniqueness: { scope: :follower }
end
