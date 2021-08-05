class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users

  def list_of_tests(level)
    Test.joins("JOIN tests_users ON tests_users.test_id = tests.id")
    .where(level: level, tests_users: {user_id: self.id})
  end
end
