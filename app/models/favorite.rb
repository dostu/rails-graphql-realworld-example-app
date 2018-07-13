class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :article, counter_cache: true

  validates :article, uniqueness: { scope: :user }
end
