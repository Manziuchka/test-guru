class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  scope :easy_tests, -> { where(level: 0..1) }
  scope :medium_tests, -> { where(level: 2..4) }
  scope :hard_tests, -> { where(level: 5..Float::INFINITY) }

  scope :tests_by_category, -> (category) { joins(:category).where(categories: {title: category}) }

end
