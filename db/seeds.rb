users = User.create([
  {name: 'Anna', email: 'mail@gmail.com'},
  {name: 'Mike', email: 'mike@gmail.com'}
  ])

categories = Category.create([
  {title: 'История'},
  {title: 'География'}
  ])

tests = Test.create([
  {title: 'История 0', level: 0, category_id: categories[0].id},
  {title: 'География 0', level: 0, category_id: categories[1].id}
])

questions = Question.create([{body: "В каком году в России отменили крепостное право?", test_id: tests[0].id}])

answers = Answer.create([
  {body: "1681", correct: false, question_id: questions[0].id},
  {body: "1861", correct: true, question_id: questions[0].id},
  {body: "1881", correct: false, question_id: questions[0].id}
])