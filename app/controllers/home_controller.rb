class HomeController < ActionController::Base 
	before_action :authenticate_user!
	before_action :create_workout
	# before_action :find_workout
	def index
		
		@user = current_user.name; 
	end

	private
		def create_workout
			if current_user.workouts.empty?
				workout_new = Workout.create 
				workout_new.user_id = current_user.id 
				workout_new.save 
			end
		end
		
		# def find_workout
		# 	@workout = current_user.workouts.find params[:workout_id]

		# end
##problem linking from main workout page to finished..come back later. 
end
