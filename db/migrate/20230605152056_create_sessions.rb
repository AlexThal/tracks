class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :sessions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :sport, null: false, foreign_key: true
      t.date :date
      t.text :comment
      t.boolean :favourite
      t.boolean :private
      t.string :photo

      t.timestamps
    end
  end
end
