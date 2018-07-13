class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  acts_as_taggable

  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, :description, :body, presence: true
end
