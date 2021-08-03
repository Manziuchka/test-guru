class User < ApplicationRecord
  def list_of_tests(level)
    Test.joins("JOIN user_tests ON user_tests.test_id = tests.id")
    .where(level: level, user_tests: {user_id: self.id})
  end
end
