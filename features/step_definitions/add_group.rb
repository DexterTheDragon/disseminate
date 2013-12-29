When(/^I visit the Add Group page$/) do
  visit new_group_path
end

When(/^I fill in the form$/) do
  fill_in 'Name', with: 'My Group'
  fill_in 'Description', with: 'The description'
  click_on 'Create Group'
end

Then(/^I should see "(.*?)"$/) do |text|
  assert(page.has_content?(text), "page has content #{text}")
end
