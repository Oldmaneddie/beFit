class ExercisesController < ApplicationController
	before_filter :find_workout
	before_filter :authenticate_user!

	def index
		@exercises = @workout.exercises
	end

	def new
		
		@exercises = @workout.exercises.build

	end

	def edit
		@workout = Workout.find params[:workout_id]
		@exercises = Exercise.find params[:id]
		
	end


	def create

		@exercises = @workout.exercises.build exercise_params
		
		@exercises.save

		if @exercises.invalid? 
			flash[:notice] = "Oops Look like you Missed Something! Try Again"
		else 
			flash[:notice] = "Nice! Exercise Logged!"
		end
		
		redirect_to workouts_path
	end

	def show
		@exercises = Exercise.find params[:id]
	end

	def destroy
	  @workout = Workout.find params[:workout_id]
	  @exercises = Exercise.find params[:id]
	  @exercises.destroy
	 
	  redirect_to root_path
	end
	
	private 
	def exercise_params
		params.require(:exercise).permit :name, :reps, :sets, :rpe ,:weight 
	end

	def find_workout
		@workout = current_user.workouts.find params[:workout_id]
	end

end
