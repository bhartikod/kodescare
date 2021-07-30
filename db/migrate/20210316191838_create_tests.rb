# frozen_string_literal: true

class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.references :user, foreign_key: true
      t.string :status
      t.datetime :time_duration
      t.string :correct_answers
      t.datetime :final_submission_time
      t.decimal :overall_score
      t.string :next_test
      t.string :test_given_on
      t.string :sample_questions, array: true, default: []
      t.timestamps
    end
  end
end
