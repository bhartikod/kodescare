class AddOptionIdToUserAnswer < ActiveRecord::Migration[5.1]
  def change
    add_column :user_answers, :option_id, :integer, array: true, default: []
  end
end
