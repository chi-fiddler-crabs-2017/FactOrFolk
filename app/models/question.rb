class Question < ActiveRecord::Base
  has_one :best_answer, class_name: "Answer"
  belongs_to :user

  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  validates :title,  :presence => true
  validates :body,  :presence => true
  validates :title,  :uniqueness => true
  validates :body,  :uniqueness => true
end
