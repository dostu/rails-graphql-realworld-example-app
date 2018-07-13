class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :articles, foreign_key: :author_id, dependent: :destroy, inverse_of: :author
  has_many :comments, foreign_key: :author_id, dependent: :destroy, inverse_of: :author
  has_many :favorites, dependent: :destroy
  has_many :favorite_articles, class_name: 'Article', through: :favorites, source: :article
  has_many :follows, foreign_key: :follower_id, dependent: :destroy, inverse_of: :follower
  has_many :followees, class_name: 'User', through: :follows
  has_many :followers, class_name: 'User', through: :follows
end
