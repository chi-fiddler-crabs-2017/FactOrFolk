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
  validates :user_id, :uniqueness => { scope: :user_id}


  def vote_count
    votes.inject(0) {|total, vote| total += vote.value}
  end

end
