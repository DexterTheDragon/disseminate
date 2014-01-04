Feature: Managing Groups
  In order to use the site
  As a group organizer
  I want to manage groups

  Background:
    Given I am signed in with provider "Developer"

  Scenario: Adding a new group
    When I visit the Add Group page
    And I submit an empty form
    Then I should receive an error message on "Name"

    When I fill in the form
    Then I should see "Group was successfully created."

  Scenario: Managing my groups
    Given there are groups owned by other users

    When I visit the Group List page
    Then I should see "0" groups

    When I create a group
    And I visit the Group List page
    Then I should see "1" groups
