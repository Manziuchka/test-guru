class User < ApplicationRecord

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable,
         :confirmable
  
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :added_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :gists

  validates :email, 
            format: { with: URI::MailTo::EMAIL_REGEXP }, 
            uniqueness: true

  def tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    self.is_a?(Admin)
  end
end
