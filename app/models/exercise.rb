class Exercise < ActiveRecord::Base
	belongs_to :workout

	validates :name, :reps, :sets, :rpe, :weight, presence: true, length: { maximum: 30 }

end
