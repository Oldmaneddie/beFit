class UsersController < ApplicationController 
	def update

		@user = User.find current_user.id

		@user.update user_params

		redirect_to workouts_path
	end

	private


	def user_params
  		params.require(:user).permit(:avatar)
	end
end
