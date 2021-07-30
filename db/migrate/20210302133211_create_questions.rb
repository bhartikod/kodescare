# frozen_string_literal: true

class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.boolean :active_question, default: false
      t.integer :question_type
      t.integer :level_id
      t.timestamps
    end
  end
end
