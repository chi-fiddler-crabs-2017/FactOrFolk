class CreateQuestionsTable < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :user, null: false
      t.string :title, null: false
      t.string :body, null: false
      t.integer :best_answer_id, foreign_key: :answer_id
      # best answer we're not going to say null: false

      t.timestamps null: false
    end
  end
end
