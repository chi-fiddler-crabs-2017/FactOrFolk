class CreateCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, null: false
      t.integer :commmentable_id, null: false
      t.string :commmentable_type, null: false
      t.string :text, null: false

      t.timestamps null: false
    end
    add_index :comments, [:commmentable_type, :commmentable_id]
  end
end
