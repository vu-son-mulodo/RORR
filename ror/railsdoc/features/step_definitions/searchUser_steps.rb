Then(/^I see "(.*?)" on page$/) do |arg1|

  page.should have_content arg1


  #page.should have_selector("a[href='http://thoughtbot.com']")
  sleep 0.50
  puts('number of rows: '+page.all('table#rounded-corner tbody tr').count.to_s)
  page.all('table#rounded-corner tbody').each { |a|
    puts(a.text)
  }
end

Given(/^I visit "(.*?)" view list user$/) do |arg1|
  #FactoryGirl.create(:minhphuc86)
  FactoryGirl.create(:tranvinh)
  FactoryGirl.create(:nguyenhoang)
  visit arg1
end