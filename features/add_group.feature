Feature: Adding a group
  In order to manage a group
  As a user
  I want to create a group

  Scenario: Adding a new group
    Given I am signed in with provider "Developer"
    When I visit the Add Group page
    And I fill in the form
    Then I should see "Group was successfully created."
