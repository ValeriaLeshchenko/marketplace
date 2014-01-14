Feature: visit home page

Scenario: Visit home page as guest
  Given I am a guest
  When I visit the home page
  Then I should see link to login
    And I should see link to register

Scenario: Visit home page as logged in seller
  Given I am a seller
  When I login
  And I visit the home page
  Then I should see link to logout
    And I should not see link to login
    And I should not see link to register