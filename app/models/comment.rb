class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :article

  validates :body, presence: true
end
