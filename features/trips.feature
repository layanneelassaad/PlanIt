Feature: user can manually add, edit, and delete a trip

  As a recent happy traveler
  So that I can share my experience from a recent trip
  I want to be able to add/edit/delete details of my trip for a large audience to see
  I feel rewarded if people can gain inspiration from my trips and implement what I did in their trip

Background: trips have been added to database

  Given the following trips exist:
  | name                     | duration |
  | Summer EuroTrip          | 25       |
  | Winter LatinAmerica Trip | 14       |
  And I am on the PlanIt home page
  Then 2 seed trips should exist

Scenario: add a trip

  Given I am on the PlanIt home page
  When I follow "Add new trip"
  Then I should be on the Create New Trip page
  When I fill in "Name" with "ESaaS Trip"
  And I fill in "Duration" with "10"
  And I press "Save Changes"
  Then I should be on the PlanIt home page
  And I should see "ESaaS Trip was successfully created."

Scenario: edit a trip

  When I go to the edit page for the trip "Summer EuroTrip"
  And  I fill in "Duration" with "30"
  And  I press "Update Trip Info"
  Then the duration of "Summer EuroTrip" should be "30"

Scenario: delete an existing trip
  
  When I go to the details page for the trip "Winter LatinAmerica Trip"
  And  I follow "Delete"
  Then I should be on the Trips page
  And I should see "Trip 'Winter LatinAmerica Trip' deleted."