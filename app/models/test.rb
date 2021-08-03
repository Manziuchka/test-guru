class Test < ApplicationRecord
  belongs_to :category

  def self.tests_by_category(category)
    Test.joins("JOIN categories ON category_id = categories.id")
    .where("categories.title = ?", category)
    .order("tests.title DESC")
    .pluck("tests.title")
  end
end
