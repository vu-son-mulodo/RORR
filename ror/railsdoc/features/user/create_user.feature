Feature: Create users


Background:
	 Given I visit "/login"
		  When I enter "mulodovn" in the "user_username" field
		    And I enter "mulodo5931" in the "user_password" field
		    And I press the "Save User" button
		  Then I should see the "Logout" page

	Scenario: Add new user
      Given I visit "/users/new"
      When I enter "FullName" in the "user_fullname" field
		And I enter "username" in the "user_username" field
		And I enter "123456" in the "user_password" field
		And I enter "123456" in the "user_password_confirmation" field
       Then I click "Save User" button
      Then I see "username" was add
      
      
      
      

   
