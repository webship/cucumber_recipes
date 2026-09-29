Feature: The listings stay closed to a member without a role
  As a site administrator
  I want the listings to open for the roles that work with them only
  So that a signed-in member without a role does not see the work of the team

  Scenario: A member without a role may not open the listings
    Given I am a logged in user with the "Authenticated user" user
    When I navigate to "/products"
    Then I should see "Access denied"
    When I navigate to "/components"
    Then I should see "Access denied"
    When I navigate to "/projects"
    Then I should see "Access denied"
    When I navigate to "/node/add/product"
    Then I should see "Access denied"
