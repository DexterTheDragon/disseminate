Given(/^I have a group called "(.*?)"$/) do |group_name|
  user = User.find_by_uid('12345')
  @group = Group.create(name: group_name, user: user)
end

When(/^I visit group page for "(.*?)"$/) do |group_name|
  visit group_path(@group)
end

When(/^I click the "(.*?)" link$/) do |arg1|
  click_on 'Add Service'
end

Then(/^I should see the following list of services:$/) do |table|
  services = table.raw.flatten
  within '.services' do
    services.each do |service|
      assert page.has_css?('a', text: service),
        "Expected to find link #{service}"
    end
  end
end

When(/^I select "(.*?)" from the services list$/) do |service|
  click_on service
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, text|
  fill_in field, with: text
end

When(/^I press "(.*?)"$/) do |arg1|
  click_on arg1
end
