class Vote < ActiveRecord::Base
  belongs_to :voteable, polymorphic: true
  belongs_to :user

  # validates :user_id, uniqueness: {scope: :answer_id}
  validates :user_id, uniqueness: {scope: :voteable_id}
  # validates :user_id, uniqueness: {scope: :comment_id}
end

