
Feature: authentication login
	Scenario: User signs in successfully
		Given I visit "/login" page
		  When I enter "mulodovn" in the "user_username" field
		    And I enter "mulodo5931" in the "user_password" field
		    And I press the "Save User" button
		  Then I should see the "Logout" page
	