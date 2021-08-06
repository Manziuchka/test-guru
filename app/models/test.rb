class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  def self.tests_by_category(category)
    Test.joins("JOIN categories ON category_id = categories.id")
    .where("categories.title = ?", category)
    .order("tests.title DESC")
  end
end
