class Comment < ActiveRecord::Base
  belongs_to :user
  # belongs_to :answer
  # belongs_to :question

  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :voteable

  def vote_count
    votes.inject(0) {|total, vote| total += vote.value}
  end
end
