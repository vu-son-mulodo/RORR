Then(/^I see "(.*?)" was update$/) do |arg1|
  page.should have_content arg1
end

Then(/^I click "(.*?)" button update$/) do |arg1|
 click_button arg1
end
Given(/^I visit "(.*?)update blog"$/) do |arg1|
  visit arg1
end

