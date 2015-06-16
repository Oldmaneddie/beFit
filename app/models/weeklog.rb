class Weeklog < ActiveRecord::Base
  belongs_to :user
  has_many :workouts

  def to_csv
  	column_names = ['name', 'reps', 'sets', 'weight']
  	CSV.generate do |csv|
  		csv << column_names
  		workouts.each do |workout|
  			workout.exercises.each do |exercise|
  				csv << exercise.attributes.values_at(*column_names)
  			end
  		end
  	end
  end
end

# so then issue was you just needed to go one full iteration deeper
# as well as customize the actual column_names manually 