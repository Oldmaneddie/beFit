class WorkoutsController < ApplicationController
	before_action :authenticate_user!
	before_action :create_workout
	before_action :create_weeklog


	def index
		@user = current_user
		@daily_workout= @user.workouts.last
		@exercises = @daily_workout.exercises.all 
		@workout = @daily_workout.id
	end
	
	

	private

	def create_workout
			if current_user.workouts.empty?
				workout_new = Workout.create 
				workout_new.user_id = current_user.id 
				workout_new.current_workout = true
				workout_new.save 
			end
	end

	def create_weeklog
		if current_user.weeklogs.where("current_week = ?", false) || current_user.weeklogs.where("current_week = ?", nil)
			weeklog_new = Weeklog.create
			weeklog_new.user_id = current_user.id
			weeklog_new.current_week = true 

			weeklog_new.save
		end 
	end

end
