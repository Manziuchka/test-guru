class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy_tests, -> { where(level: 0..1) }
  scope :medium_tests, -> { where(level: 2..4) }
  scope :hard_tests, -> { where(level: 5..Float::INFINITY) }

  scope :by_category, -> (category) { joins(:category).where(categories: {title: category}) }

  def self.tests_by_category(category)
    by_category(category).order(title: :desc).pluck(:title)
  end
end
