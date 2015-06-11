class WorkoutsController < ActionController::Base
	def index
		@user = current_user
		@daily_workout= @user.workouts.last
		@exercises = @daily_workout.exercises.all 
	end
end
