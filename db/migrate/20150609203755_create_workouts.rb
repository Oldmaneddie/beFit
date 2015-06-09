class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.integer :t_volume
      t.integer :t_reps
      t.integer :avg_rpe

      t.timestamps null: false
    end
  end
end
