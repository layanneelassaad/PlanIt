require 'rails_helper'
# require 'spec_helper'

RSpec.describe TripsController, type: :controller do
    describe 'show' do 
        it 'shows the trip and activities assosiated with it' do 
            trip = Trip.create(name: 'Show Test', duration: 'Test Duration')
            get :show, {id: trip.id}
            expect(Trip.where(name: 'Show Test').count).to eq(1)
        end 
    end

    describe 'add_activity' do
        it 'adds an activity to a trip' do
            trip = Trip.create(name: 'Test Name', duration: 'Test Duration')
            activity = Activity.create(name: 'Activity Name')
            post :add_activity, {id: trip.id, activity: {id: activity.id} }
            expect(TripActivity.where(trip: trip, activity: activity).count).to eq(1)
        end
    end

    describe 'delete_activity' do
        it 'deletes an activity from a trip' do
          trip = Trip.create(name: 'Test Name', duration: 'Test Duration')
          activity = Activity.create(name: 'Activity Name')
          trip_activity = TripActivity.create(trip: trip, activity: activity)
          delete :delete_activity, {id: trip.id, activity_id: activity.id} 
          expect(TripActivity.where(trip: trip, activity: activity).count).to eq(0)
        end
    end

    describe 'update' do
        it 'update the attributes of a trip' do
            trip = Trip.create(name: 'Test Update', duration: 'Test Duration')
            patch :update, {id: trip.id, trip: {name: 'Test Update', duration: 'Duration After Update'} }
            expect(Trip.where(duration: 'Duration After Update').count).to eq(1)
        end
    end

	describe 'create' do
		it 'should create new trip with set params' do
			post :create, {trip: {name: 'Create Name', duration: 'Create Duration'} }
			expect(Trip.where(name: 'Create Name').count).to eq(1)
		end
	end 

	describe 'destroy' do
		it 'delete trip from website' do
			trip = Trip.create(name: 'Test Delete')
			delete :destroy, {id: trip.id}
			expect(Trip.where(name: 'Test Delete').count).to eq(0)
		end
	end 

end