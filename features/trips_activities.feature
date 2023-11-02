Feature: activities can be associated to and deleted from trips

  As a recent traveler
  I want to be able to associate activities with my trips
  Since activites can have an address, description, and url
  It will give the viewer a better idea of the things I did on this trip

Background: trips and activities have been added to database

  Given the following trips exist:
  | name                     | duration |
  | Summer EuroTrip          | 20       |

  And the following activities exist:
  | name         | address                        | description                | url                           |
  | Eiffel Tower | Champ de Mars, Paris, France   | Iconic building in Paris.  | https://www.toureiffel.paris/ |
  | London Eye   | Riverside Building, London, UK | Iconic building in London. | https://www.londoneye.com/    |

  And the following activity was added to the trip
  | trip            | activity   | 
  | Summer EuroTrip | London Eye | 

Scenario: add an activity to a trip

  Given I am on the details page for the trip "Summer EuroTrip"
  When I select "Eiffel Tower" from "Activities Available"
  And I press "Add Activity to my Trip"
  Then I should be on the details page for the trip "Summer EuroTrip"
  And I should see "Eiffel Tower was successfully added to Summer EuroTrip."

Scenario: delete an activity from a trip
  
  Given I am on the details page for the trip "Summer EuroTrip"
  When I follow "Remove"
  Then I should be on the details page for the trip "Summer EuroTrip"
  And I should see "London Eye was successfully deleted from Summer EuroTrip."