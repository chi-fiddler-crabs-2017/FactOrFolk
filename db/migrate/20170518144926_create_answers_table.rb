class CreateAnswersTable < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :user, null: false
      t.references :question, null: false
      t.string :text, null: false

      t.timestamps null: false
    end
  end
end
