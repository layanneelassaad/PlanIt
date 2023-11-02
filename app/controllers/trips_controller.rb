class TripsController < ApplicationController

  def show
    id = params[:id] # retrieve trip ID from URI route
    @trip = Trip.find(id) # look up trip by unique ID
    # Filter activities that are not already part of the trip
    @unique_activities = Activity.all.order(:name).filter { |activity| not @trip.activities.include?(activity) }
    # will render app/views/trips/show.<extension> by default
  end

  def index
    @trips = Trip.all
  end

  def new
    # default: render 'new' template
  end

  def create
    @trip = Trip.create!(trip_params)
    flash[:notice] = "#{@trip.name} was successfully created."
    redirect_to trips_path
  end

  def edit
    @trip = Trip.find params[:id]
  end

  def update
    @trip = Trip.find params[:id]
    @trip.update_attributes!(trip_params)
    flash[:notice] = "#{@trip.name} was successfully updated."
    redirect_to trip_path(@trip)
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    flash[:notice] = "Trip '#{@trip.name}' deleted."
    redirect_to trips_path
  end

  def add_activity
    @trip = Trip.find params[:id]
    @activity = Activity.find params[:activity][:id]
    @trip.trip_activities.create(:activity => @activity)
    flash[:notice] = "#{@activity.name} was successfully added to #{@trip.name}."
    redirect_to trip_path(@trip)
  end

  def delete_activity
    @trip = Trip.find params[:id]
    @activity = Activity.find params[:activity_id]
    @trip_activity = TripActivity.where(:trip => @trip).where(:activity => @activity)
    @trip_activity.first.destroy
    flash[:notice] = "#{@activity.name} was successfully deleted from #{@trip.name}."
    redirect_to trip_path(@trip)
  end

  private
  # Making "internal" methods private is not required, but is a common practice.
  # This helps make clear which methods respond to requests, and which ones do not.
  def trip_params
    params.require(:trip).permit(:name, :duration)
  end
end
