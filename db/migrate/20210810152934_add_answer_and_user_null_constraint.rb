class AddAnswerAndUserNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:answers, :body, false)
    change_column_null(:users, :email, false)
  end
end
