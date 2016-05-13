#Create Users
40.times do
  User.create(
             username: Faker::Internet.user_name,
             password: Faker::Internet.password(8),
             email: Faker::Internet.safe_email
             )
end

#Create questions
40.times do
  user = User.all.sample
  user.questions << Question.create!(title: Faker::Hipster.sentence, text: Faker::Hipster.paragraph)
end

#Create answers
40.times do
  user = User.all.sample
  user.answers << Answer.create!(text: Faker::Hipster.paragraph)
end
