Then(/^I see "(.*?)" was add$/) do |arg1|
  page.should have_content arg1
end

Then(/^I click "(.*?)" button$/) do |arg1|
 click_button arg1
end

