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

Given(/^there are groups owned by other users$/) do
  #TODO: replace with FactoryGirl
  user = User.create(name: 'Bugs Bunny')
  Group.create(name: 'Looney Tunes', user: user)
end

When(/^I visit the Group List page$/) do
  visit groups_path
end

Then(/^I should see "(.*?)" groups$/) do |count|
  within_table('groups') do
    assert page.has_css?('tbody tr', count: count.to_i), "Expected #{count} found #{page.all('tbody tr').length}"
  end
end

When(/^I create a group$/) do
  step %{I visit the Add Group page}
  step %{I fill in the form}
  step %{I visit the Group List page}
end
