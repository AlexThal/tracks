class CreateBlocks < ActiveRecord::Migration[7.0]
  def change
    create_table :blocks do |t|
      t.references :category, null: false, foreign_key: true
      t.references :session, null: false, foreign_key: true
      t.string :name
      t.text :note
      t.string :gear
      t.string :rest_between_sets
      t.json :custom_field
      t.timestamps
    end
  end
end
