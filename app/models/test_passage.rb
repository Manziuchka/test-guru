class TestPassage < ApplicationRecord
  PASS_RATE = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question


  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def question_number
    test.questions.ids.sort.index(current_question.id) + 1
  end

  def rate
    correct_questions / test.questions.count.to_f * 100
  end

  def passed?
    rate >= PASS_RATE
  end
   
  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_update_set_next_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    if answer_ids.present?
      correct_answers.ids.sort == answer_ids.map(&:to_i).sort
    else
      false
    end    
  end

  def correct_answers
    current_question.answers.right_answers
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
