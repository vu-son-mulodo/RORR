Feature: Create Blog


Background:
	 Given I visit "/login" page
		  When I enter "mulodovn" in the "user_username" field
		    And I enter "mulodo5931" in the "user_password" field
		    And I press the "Save User" button
		  Then I should see the "Logout" page

	Scenario: Add new Blog
      Given I visit "/blogs/new"
      When I enter "PhucTung1" in the "blog_title" field
		And I enter "Phuc Tung" in the "blog_content" field
       Then I click "Save Blog" button
      Then I see "PhucTung1" was add

      Given I visit "/blogs/new"
      When I enter "PhucTung2" in the "blog_title" field
		And I enter "Phuc Tung2" in the "blog_content" field
        Then I click "Save Blog" button
      Then I see "PhucTung2" was add

	  Given I visit "/blogs/new"
      When I enter "" in the "blog_title" field
		And I enter "Phuc Tung3" in the "blog_content" field
        Then I click "Save Blog" button
      Then I see "title : can't be blank"

	  Given I visit "/blogs/new"
      When I enter "title" in the "blog_title" field
		And I enter "" in the "blog_content" field
        Then I click "Save Blog" button
      Then I see "content : can't be blank"

	  Given I visit "/blogs/new"
      When I enter "" in the "blog_title" field
		And I enter "" in the "blog_content" field
        Then I click "Save Blog" button
      Then I see "title : can't be blank"
	  Then I see "content : can't be blank"