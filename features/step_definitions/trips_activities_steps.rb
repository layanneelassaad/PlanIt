Given /the following activity was added to the trip/ do |trips_activities_table|
  trips_activities_table.hashes.each do |trip_activity|
    @trip = Trip.find_by_name trip_activity[:trip]
    @activity = Activity.find_by_name trip_activity[:activity]
    @trip.trip_activities.create(:activity => @activity)
  end
end