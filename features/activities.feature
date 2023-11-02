Feature: user can manually add, edit, and delete an activity

  As a recent traveler
  I want to share the recent activities I did for everyone to see
  Without having to share my entire trip
  I want to be able to include links, descriptions, and location of the activites to help the small businesses I enjoyed

Background: activities have been added to database

  Given the following activities exist:
  | name         | address                        | description                | url                           |
  | Eiffel Tower | Champ de Mars, Paris, France   | Iconic building in Paris.  | https://www.toureiffel.paris/ |
  | London Eye   | Riverside Building, London, UK | Iconic building in London. | https://www.londoneye.com/    |
  And I am on the PlanIt home page
  Then 2 seed activities should exist

Scenario: add an activity

  Given I am on the PlanIt Activities page
  When I follow "Add new activity"
  Then I should be on the Create New Activity page
  When I fill in "Name" with "Empire State"
  And I fill in "Address" with "20 W 34th St., New York, NY"
  And I fill in "Description" with "The world's most magnificent Art Deco skyscraper, it's a living piece of New York history."
  And I fill in "Link" with "https://www.esbnyc.com"
  And I press "Save Changes"
  Then I should be on the PlanIt Activities page
  And I should see "Empire State was successfully created."

Scenario: edit an activity

  When I go to the edit page for the activity "London Eye"
  And  I fill in "Address" with "Riverside Building, London, United Kingdom"
  And  I press "Update Activity Info"
  Then the address of "London Eye" should be "Riverside Building, London, United Kingdom"

Scenario: delete an existing activity
  
  When I go to the details page for the activity "Eiffel Tower"
  And  I follow "Delete"
  Then I should be on the Activities page
  And I should see "Activity 'Eiffel Tower' deleted."