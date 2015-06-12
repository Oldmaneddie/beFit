class WeeklogsController < ApplicationController
	before_action :authenticate_user!
	
	def new
		weeklog = Weeklog.where("current_week = ?", true )
		@WeekReport = weeklog.workouts 

	end

	
end
