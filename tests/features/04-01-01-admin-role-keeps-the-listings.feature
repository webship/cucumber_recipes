Feature: The Admin role keeps the products, the components and the projects
  As a member of the Admin role
  I want to add a product, a component and a project, and to find them in their listings
  So that the features of the team have something to belong to

  Background:
    Given I am a logged in user with the "Admin" user

  Scenario Outline: The Admin role adds a <type>
    When I navigate to "/node/add/<type>"
    Then I should not see "Access denied"
    When I fill in "Name" with "Admin role <type>"
     And I press "Save"
    Then I should see "Admin role <type> has been created."
    When I navigate to "/<listing>"
    Then I should see "Admin role <type>"

    Examples:
      | type      | listing    |
      | product   | products   |
      | component | components |

  Scenario Outline: The "<listing>" listing says when it has nothing to show
    When I navigate to "/<listing>?title=there-is-no-such-title"
    Then I should see "<text>"
     And I should not see "Admin role"

    Examples:
      | listing    | text               |
      | products   | No products yet.   |
      | components | No components yet. |
      | projects   | No projects yet.   |
