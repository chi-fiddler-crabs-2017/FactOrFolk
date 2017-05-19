class Question < ActiveRecord::Base
  has_one :best_answer, class_name: "Answer"
  belongs_to :user

  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
end
