class CreateVotesTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :voteable_id
      t.string :voteable_type
      t.integer :value, null: false
      t.references :user, null: false

      t.timestamps null: false
    end
    add_index :votes, [:voteable_type, :voteable_id]
  end
end
