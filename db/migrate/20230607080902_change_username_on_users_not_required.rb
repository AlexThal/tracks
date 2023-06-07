class ChangeUsernameOnUsersNotRequired < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :username, :string, null: true
  end
end
