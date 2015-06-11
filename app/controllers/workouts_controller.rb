class WorkoutsController < ActionController::Base
	before_action :authenticate_user!
	before_action :create_workout

	def index
		@user = current_user
		@daily_workout= @user.workouts.last
		@exercises = @daily_workout.exercises.all 
	end

	private

	def create_workout
			if current_user.workouts.empty?
				workout_new = Workout.create 
				workout_new.user_id = current_user.id 
				workout_new.save 
			end
	end
end
