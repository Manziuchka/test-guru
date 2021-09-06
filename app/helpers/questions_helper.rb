module QuestionsHelper
  def question_header(question)
    if question.new_record?
      "Создать новый вопрос для теста - #{question.test.title}"
    else
      "Редактировать вопрос для теста - #{question.test.title}"
    end
  end
end
