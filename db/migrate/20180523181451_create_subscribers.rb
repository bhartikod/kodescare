# frozen_string_literal: false

class CreateSubscribers < ActiveRecord::Migration[5.1]
  def change
    create_table :subscribers do |t|
      t.string :email
      t.timestamps
    end
  end
end
