class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_numbers_of_answers

  scope :right_answers, -> { where(correct: true) }

  private

  def validate_numbers_of_answers
    errors.add(:answers, 'too much') if question.answers.count >= 4
  end
end
