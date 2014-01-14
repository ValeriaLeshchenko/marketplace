Feature: Login in the application

Scenario: Login with valid email and password
  Given I am a seller
  When i visit the login page
    And i fill in my email and password
      Then I login successfully
      And get redirected to my profile