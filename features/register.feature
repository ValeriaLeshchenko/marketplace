Feature: Register in the application

Scenario: Register with valid email, password and confirmation
  Given I am a guest
  When i visit the register page
    And i fill in my email, password and confirmation
      Then I register successfully
      And get redirected to my profile