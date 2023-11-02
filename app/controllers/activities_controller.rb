class ActivitiesController < ApplicationController

  def show
    id = params[:id] # retrieve activity ID from URI route
    @activity = Activity.find(id) # look up activity by unique ID
    # will render app/views/activities/show.<extension> by default
  end

  def index
    @activities = Activity.all
  end

  def new
    # default: render 'new' template
  end

  def create
    @activity = Activity.create!(activity_params)
    flash[:notice] = "#{@activity.name} was successfully created."
    redirect_to activities_path
  end

  def edit
    @activity = Activity.find params[:id]
  end

  def update
    @activity = Activity.find params[:id]
    @activity.update_attributes!(activity_params)
    flash[:notice] = "#{@activity.name} was successfully updated."
    redirect_to activity_path(@activity)
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    flash[:notice] = "Activity '#{@activity.name}' deleted."
    redirect_to activities_path
  end

  private
  # Making "internal" methods private is not required, but is a common practice.
  # This helps make clear which methods respond to requests, and which ones do not.
  def activity_params
    params.require(:activity).permit(:name, :address, :description, :url)
  end
end
