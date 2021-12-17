class AddUserToGeneralInformations < ActiveRecord::Migration[5.1]
  def change
    add_reference :general_informations, :user, foreign_key: true
  end
end
