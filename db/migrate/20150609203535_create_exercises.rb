class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :reps
      t.integer :sets
      t.integer :rpe
      t.integer :weight

      t.timestamps null: false
    end
  end
end
