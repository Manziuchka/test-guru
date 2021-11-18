Test.destroy_all
Category.destroy_all
Question.destroy_all
Answer.destroy_all
User.destroy_all

users = User.create!([
  { name: 'Anna 1', email: 'mail@gmail.com' },
  { name: 'Mike 1', email: 'mike@gmail.com' }
])

categories = Category.create!([
  { title: 'История' },
  { title: 'География' }
])

tests = Test.create!([
  { title: 'История 0', level: 0, category_id: categories[0].id, author_id: users[0].id },
  { title: 'География 0', level: 0, category_id: categories[1].id, author_id: users[0].id }
])

questions = Question.create([{ body: 'В каком году в России отменили крепостное право?', test_id: tests[0].id }])

answers = Answer.create([
      { body: '1681', correct: false, question_id: questions[0].id },
      { body: '1861', correct: true, question_id: questions[0].id },
      { body: '1881', correct: false, question_id: questions[0].id }
    ])



