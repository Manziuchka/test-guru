class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :added_tests, class_name: "Test", foreign_key: "author_id"

  def list_of_tests(level)
    Test.joins("JOIN tests_users ON tests_users.test_id = tests.id")
    .where(level: level, tests_users: {user_id: self.id})
  end
end
