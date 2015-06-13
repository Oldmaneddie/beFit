class WeeklogsController < ApplicationController
	before_action :authenticate_user!
	
	def new
		weeklog = Weeklog.first 
		@WeekReport = weeklog.workouts

	end

	
end
