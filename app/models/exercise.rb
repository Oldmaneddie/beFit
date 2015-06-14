class Exercise < ActiveRecord::Base
	belongs_to :workout

	validates :name, :reps, :sets, :rpe, :weight, presence: true, length: { maximum: 10 }

end
