class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :body
      t.belongs_to :author, references: :users, index: true
      t.belongs_to :article, index: true

      t.timestamps
    end
  end
end
