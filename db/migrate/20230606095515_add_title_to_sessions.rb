class AddTitleToSessions < ActiveRecord::Migration[7.0]
  def change
    add_column :sessions, :title, :string
  end
end
