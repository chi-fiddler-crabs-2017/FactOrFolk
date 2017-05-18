class CreateCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, null: false
      t.integer :commentable_id
      t.string :commentable_type
      t.string :text, null: false

      t.timestamps null: false
    end
    add_index :comments, [:commentable_type, :commentable_id]
  end
end
