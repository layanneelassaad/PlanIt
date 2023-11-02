class Trip < ActiveRecord::Base
    has_many :trip_activities
    has_many :activities, through: :trip_activities
end
