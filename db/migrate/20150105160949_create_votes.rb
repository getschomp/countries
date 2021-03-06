class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :review_id, null: false
      t.integer :user_id, null: false
      t.integer :value, null: false

      t.timestamps null: false
    end

    add_index :votes, [:review_id, :user_id], unique: true
  end
end
