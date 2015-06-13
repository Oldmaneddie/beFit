class WorkoutsController < ApplicationController
	before_action :authenticate_user!
	before_action :create_weeklog
	before_action :create_workout
	before_action :check_new_weeklog
	before_action :check_new_active_workout
	


	def index
		@user = current_user
		@daily_workout= @user.workouts.find_by current_workout:true 
		@exercises = @daily_workout.exercises.all 
		@workout = @daily_workout.id
	end
	
	

	private

	# Primary issue right now is that I need to find a way to check all current_user workouts/weeklogs to see if any are false 
	# and then recreate the log itself and then when you save it it'll just set them to false and then that'll keep track and 
	# then figure out a way to have a tracked array keep track of workouts. 
	def create_weeklog
		if current_user.weeklogs.empty? 
			@weeklog_new = Weeklog.create
			@weeklog_new.user_id = current_user.id
			@weeklog_new.current_week = true 

			@weeklog_new.save
		end 
	end

	def create_workout

			if current_user.workouts.empty?  
				@workout_new = Workout.create 
				@workout_new.user_id = current_user.id
				@workout_new.weeklog_id = @weeklog_new.id 
				@workout_new.current_workout = true
				@workout_new.save 
			end
	end

	def check_new_active_workout
	
			if current_user.workouts.last.current_workout == false
				@workout_new = Workout.create 
				@workout_new.user_id = current_user.id
				weeklog_id = Weeklog.find_by current_week:true 
				@workout_new.weeklog_id = weeklog_id.id 
				@workout_new.current_workout = true
				@workout_new.save 
			end


	end

	def check_new_weeklog #don't know if this works..trying to test it has been catastrophic lol 
		 weeklog = current_user.weeklogs.find_by current_week:true 
		 endofweek = weeklog.created_at.days_since(7)


		if endofweek < Time.now 
			weeklog.current_week = false
			weeklog.save!
		end 

		if current_user.weeklogs.last.current_week == false
			@weeklog_new = Weeklog.create
			@weeklog_new.user_id = current_user.id
			@weeklog_new.current_week = true 

			@weeklog_new.save
		
		end

	end
end
