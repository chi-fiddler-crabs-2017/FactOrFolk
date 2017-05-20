class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  # validates :text, presence: true
  validate :answer_not_blank

  def answer_not_blank
    unless self.text.length > 5
      errors.add(:text, ": You can't not answer this question.")
    end
  end

  def vote_count
    votes.inject(0) {|total, vote| total += vote.value}
  end

end
