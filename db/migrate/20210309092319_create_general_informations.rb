# frozen_string_literal: false

class CreateGeneralInformations < ActiveRecord::Migration[5.1]
  def change
    create_table :general_informations do |t|
      t.string :course
      t.string :attend
      t.string :class_type
      t.datetime :dob
      t.string :gender
      t.string :graduation_year
      t.string :full_time_work
      t.string :how_hear
      t.string :is_laptop

      t.timestamps
    end
  end
end
