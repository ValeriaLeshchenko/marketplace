Feature: Edit seller's profile

Scenario: Seller edits own profile
  Given I am a seller
  When I login
  And I visit my profile
    Then I visit profile edit page
    And I enter valid data
      Then Profile is successfully updated
      And I get redirected to profile show page