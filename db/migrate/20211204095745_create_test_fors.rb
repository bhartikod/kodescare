class CreateTestFors < ActiveRecord::Migration[5.1]
  def change
    create_table :test_fors do |t|
      t.integer :scq
      t.integer :mcq
      t.integer :text
      t.integer :code
      t.string :level
      t.integer :total_ques

      t.timestamps
    end
  end
end
