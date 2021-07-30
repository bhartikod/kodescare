# frozen_string_literal: false

class CreateOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :options do |t|
      t.references :question, foreign_key: true
      t.string :value
      t.boolean :correct_option, default: false
      t.integer :question_type

      t.timestamps
    end
  end
end
