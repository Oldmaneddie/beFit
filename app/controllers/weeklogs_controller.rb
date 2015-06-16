class WeeklogsController < ApplicationController
	before_action :authenticate_user!
	
	def new
		weeklog = Weeklog.find_by current_week:true
		@WeekWorkouts = weeklog.workouts
		@WeekWorkouts.where("current_workout =?",true).update_all(current_workout:false)
		
		redirect_to workouts_path 
	end

	def show
		weeklog = Weeklog.find_by params[:id]
		@weekrecords = weeklog.workouts

		respond_to do |format|
			format.html
			format.csv { render text: weeklog.to_csv }
			#didn't need weekrecords instead all you needed was the record
		end
	end

end
