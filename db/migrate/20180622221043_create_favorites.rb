class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.belongs_to :user, index: true
      t.belongs_to :article, index: true

      t.timestamps

      t.index [:user_id, :article_id], unique: true
    end
  end
end
