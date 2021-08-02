class User < ApplicationRecord
  def list_of_tests(level)
    Test.joins("JOIN user_tests ON user_tests.test_id = tests.id")
    .where("tests.level = ?", level)
    .pluck("tests.title")
  end
end
