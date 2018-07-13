class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :slug
      t.string :description
      t.string :body
      t.integer :favorites_count, default: 0
      t.belongs_to :author, references: :users, index: true

      t.timestamps
    end
  end
end
