class WeeklogsController < ApplicationController
	before_action :authenticate_user!
	
	def new
		weeklog = Weeklog.last 
		@WeekReport = weeklog.workouts 
		

	end

	
end
