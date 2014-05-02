Feature: Links
  
  Scenario: Clicking on new link
    Given I am on the homepage
    When I click on "New"
    Then I should see new link form

  Scenario: Adding a new link
    Given I am on the new link page
    When I add a new link
    Then I should see the link on the homepage