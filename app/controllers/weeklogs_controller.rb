class WeeklogsController < ApplicationController
	before_action :authenticate_user!
	
	def new
		weeklog = Weeklog.find_by current_week:true
		@WeekWorkouts = weeklog.workouts
		@WeekWorkouts.where("current_workout =?",true).update_all(current_workout:false)

		redirect_to workouts_path 
	end

	
end
