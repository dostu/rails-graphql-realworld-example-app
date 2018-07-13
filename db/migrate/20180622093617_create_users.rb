class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :bio
      t.string :image
      t.integer :follows_count, default: 0

      t.timestamps
    end
  end
end
