class CreateExerciseSets < ActiveRecord::Migration[7.0]
  def change
    create_table :exercise_sets do |t|
      t.string :distance
      t.string :weight
      t.string :repetitions
      t.references :block, null: false, foreign_key: true
      t.json :custom_field
      t.timestamps
    end
  end
end
