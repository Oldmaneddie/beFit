class AddWeeklogRefToWorkouts < ActiveRecord::Migration
  def change
    add_reference :workouts, :weeklog, index: true, foreign_key: true
  end
end
