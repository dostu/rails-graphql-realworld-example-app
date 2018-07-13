class CreateFollows < ActiveRecord::Migration[5.1]
  def change
    create_table :follows do |t|
      t.belongs_to :follower, index: true
      t.belongs_to :followee, index: true

      t.timestamps

      t.index [:follower_id, :followee_id], unique: true
    end
  end
end
