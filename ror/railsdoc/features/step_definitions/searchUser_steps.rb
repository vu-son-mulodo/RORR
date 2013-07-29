Then(/^I see "(.*?)" on page$/) do |arg1|
  page.should have_content arg1
end

Given(/^I visit "(.*?)" view list user$/) do |arg1|
  #FactoryGirl.create(:minhphuc86)
  FactoryGirl.create(:tranvinh)
  FactoryGirl.create(:nguyenhoang)
  visit arg1
end