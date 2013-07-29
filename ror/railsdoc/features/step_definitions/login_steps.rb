@user =nil
Given(/^I visit "(.*?)" page$/) do |arg1|
  @user = FactoryGirl.create(:admin)
  visit arg1
end

When(/^I enter "(.*?)" in the "(.*?)" field$/) do |arg1, arg2|
  fill_in arg2, :with => arg1
end

When(/^I press the "(.*?)" button$/) do |arg1|
 click_button arg1
end

Then(/^I should see the "(.*?)" page$/) do |arg1|
  page.should have_content arg1
end


