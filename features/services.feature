Feature: Managing Services
  In order to use the site
  As a group organizer
  I want to manage services

  Background:
    Given I am signed in with provider "Developer"
    And I have a group called "My Group"

  Scenario: Adding a new service
    When I visit group page for "My Group"
    And I click the "Add Service" link
    Then I should see the following list of services:
      | Mailing List |

    When I select "Mailing List" from the services list
    And I fill in "Email address" with "foo@example.com"
    And I press "Create Mailing list service"
    Then I should see "Service was successfully created."
