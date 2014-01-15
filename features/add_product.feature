Feature: Add new product

Scenario: Seller adds new product with valid data
  Given I am a seller
  When I login
  And I get redirected to profile show page
    Then I click the link to add product page
    And I get redirected to product add page
      Then I submit the form with valid product data
        And the product is created
        And I get redirected to home page