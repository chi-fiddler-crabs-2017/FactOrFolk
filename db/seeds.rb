10.times do
  User.create(email: Faker::Internet.safe_email, password: "password", username: Faker::HarryPotter.character)
end

10.times do
  Question.create(title: Faker::HarryPotter.location, body: Faker::HarryPotter.quote, user_id: Faker::Number.between(1,10))
end

10.times do
  Answer.create(text: Faker::StarWars.wookie_sentence, question_id: Faker::Number.between(1,10), user_id: Faker::Number.between(1,10))
end

question_comments = 10.times do
  Comment.new(text: Faker::StarWars.quote, user_id: Faker::Number.between(1,10))
end

answer_comments = 10.times do
  Comment.new(text: Faker::StarWars.quote, user_id: Faker::Number.between(1,10))
end

question_comments.each do |comment|
  user = User.find(Faker::Numer.between(1, 10))
  user.comments << comment
  comment.save
end

answer_comments.each do |comment|
  user = User.find(Faker::Numer.between(1, 10))
  user.comments << comment
  comment.save
end

answer_votes = 5.times do
  Vote.new([1, -1].sample)
end

comment_votes = 5.times do
  Vote.new([1, -1].sample)
end

question_votes = 5.times do
  Vote.new([1, -1].sample)
end

answer_votes.each do |vote|
  answer = Answer.find(Faker::Numer.between(1, 10))
  answer.votes << vote
  vote.save
end

comment_votes.each do |vote|
  comment = Comment.find(Faker::Numer.between(1, 10))
  comment.votes << vote
  vote.save
end

question_votes.each do |vote|
  question = Question.find(Faker::Numer.between(1, 10))
  question.votes << vote
  vote.save
end





