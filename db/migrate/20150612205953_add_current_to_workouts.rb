class AddCurrentToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :current_workout, :boolean
  end
end
