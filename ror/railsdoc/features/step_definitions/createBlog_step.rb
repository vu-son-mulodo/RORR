Then(/^I see "(.*?)" was add blog$/) do |arg1|
  page.should have_content arg1
end
Then(/^I see "(.*?)" was found$/) do |arg1|
  page.should have_content arg1
end

Then(/^I click "(.*?)" button save blog$/) do |arg1|
 click_button arg1
end
Given(/^I visit "(.*?)blog"$/) do |arg1|
  visit arg1
end
Then(/^I see "(.*?)"$/) do |arg1|
  puts "can't be blank"
end
