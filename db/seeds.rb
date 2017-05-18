10.times do
  User.create(email: Faker::Internet.safe_email, password: "password", username: Faker::HarryPotter.character)
end

all_users = User.all

10.times do
  q = Question.create(title: Faker::HarryPotter.location, body: Faker::HarryPotter.quote, user: all_users.sample)
  q.comments << Comment.new(text: Faker::StarWars.quote, user: all_users.sample)
  q.votes << Vote.new(value: [1, -1].sample, user: all_users.sample)

end

all_questions = Question.all

10.times do
  a = Answer.create(text: Faker::StarWars.wookie_sentence, question: all_questions.sample, user: all_users.sample)
  a.comments << Comment.new(text: Faker::StarWars.quote, user: all_users.sample)
  a.votes << Vote.new(value: [1, -1].sample, user: all_users.sample)
end

all_comments = Comment.all

all_comments.each do |comment|
  comment.votes <<  Vote.new(value: [1, -1].sample, user: all_users.sample)
end
