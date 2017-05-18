class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :hashed_password, null: false
      t.string :username, null: false

      t.timestamps null: false
    end
  end
end