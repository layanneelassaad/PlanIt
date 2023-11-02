class TripActivity < ActiveRecord::Base
    belongs_to :trip
    belongs_to :activity
end