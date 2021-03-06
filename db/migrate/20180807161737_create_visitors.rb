# frozen_string_literal: true

class CreateVisitors < ActiveRecord::Migration[5.1]
  def change
    create_table :visitors do |t|
      t.string :ip_address
      t.string :temp_email
      t.integer :visits, default: 0

      t.timestamps
    end
  end
end
