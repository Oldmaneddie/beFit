class HomeController < ActionController::Base 
	before_action :authenticate_user!
	#before_action :create_workout
	def index
		
		@user = current_user.name; 
		
		if current_user.workouts.empty?
			@workout = Workout.create 
			@workout.user_id = current_user.id 
			@workout.save 
		end
		
		

	end

	private

	# def create_workout
	# 	if current_user.workouts.empty?

	# end


end
