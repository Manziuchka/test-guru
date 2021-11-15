class DeleteCurrentQuestion < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :test_passages, :current_questions
  end
end
