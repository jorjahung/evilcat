Feature: Links
  
  Scenario: Clicking on new link
    Given I am on the homepage
    When I click on "New"
    Then I should see new link form

  Scenario: Adding a new link
    Given I am on the new link page
    When I add a new link
    Then I should see the link on the homepage

  Scenario: Viewing a link
    Given I have added a link
    When I view the profile page for that link
    Then I should see all its details
    And a screenshot of the page