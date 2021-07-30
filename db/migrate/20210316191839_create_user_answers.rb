# frozen_string_literal: false

class CreateUserAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :user_answers do |t|
      t.references :test, foreign_key: true
      t.references :question, foreign_key: true
      t.references :option, foreign_key: true
      t.string :text_content
      t.boolean :correct_answer

      t.timestamps
    end
  end
end
