class ExercisesController < ActionController::Base 
	before_filter :find_workout
	before_filter :authenticate_user!
	def index
		@exercises = @workout.exercises
	end

	def new
		@exercises = @workout.exercises.build

	end

	def create
		@exercises = @workout.exercises.build exercise_params
		@exercises.save
			##look into nested controller 
		redirect_to workout_exercise_path(@workout,@exercises)
	end

	def show
		@exercises = Exercise.find params[:id]
	end


	private 
	def exercise_params
		params.require(:exercise).permit :name, :reps, :sets, :rpe ,:weight 
	end

	def find_workout
		@workout = current_user.workouts.find params[:workout_id]
	end

end
