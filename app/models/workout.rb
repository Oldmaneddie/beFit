class Workout < ActiveRecord::Base
	belongs_to :user
	belongs_to :weeklog
	has_many :exercises, dependent: :destroy

end
