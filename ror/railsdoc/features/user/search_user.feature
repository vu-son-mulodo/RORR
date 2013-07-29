@javascript
Feature: Search user
Background:
	 Given I visit "/login" page
		  When I enter "mulodovn" in the "user_username" field
		    And I enter "mulodo5931" in the "user_password" field
		    And I press the "Save User" button
		  Then I should see the "Logout" page
	Scenario: Search  user
      Given I visit "/users" view list user
      When I enter "tran.vinh" in the "searchbox" field
      Then I see "tran.vinh" on page
      
      
      
      

   
