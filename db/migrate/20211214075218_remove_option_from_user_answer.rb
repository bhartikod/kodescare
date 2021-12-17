class RemoveOptionFromUserAnswer < ActiveRecord::Migration[5.1]
  def change
    remove_reference :user_answers, :option, foreign_key: true
  end
end
