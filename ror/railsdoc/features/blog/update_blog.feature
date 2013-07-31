@javascript
Feature: Update Blog
Background:
	 Given I visit "/login" page
		  When I enter "mulodovn" in the "user_username" field
		    And I enter "mulodo5931" in the "user_password" field
		    And I press the "Save User" button
		  Then I should see the "Logout" page

	Scenario: Update a Blog
      Given I visit "/blogs/edit/1"
      When I enter "PhucTung2" in the "blog_title" field
		And I enter "Phuc Tung2" in the "blog_content" field
       Then I click "Save Blog" button
      Then I see "PhucTung2" was update