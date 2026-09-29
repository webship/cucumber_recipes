Feature: Installing a Cucumber Recipes module applies its user role recipes
  As a site administrator
  I want the admin and super admin roles to be created and granted access
  So that the listing pages are reachable by the roles the recipes name

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: The admin and super admin roles exist
    When I navigate to "/admin/people/roles"
    Then I should see "Admin"
     And I should see "Super Admin"

  Scenario: The Admin role may access all three listing pages
    When I navigate to "/admin/people/permissions/admin"
    Then the element "#edit-admin-access-components-page" with the attribute "checked" and the value "checked" should exist
     And the element "#edit-admin-access-products-page" with the attribute "checked" and the value "checked" should exist
     And the element "#edit-admin-access-projects-page" with the attribute "checked" and the value "checked" should exist

  Scenario: The Super Admin role may access all three listing pages
    When I navigate to "/admin/people/permissions/super_admin"
    Then the element "#edit-super-admin-access-components-page" with the attribute "checked" and the value "checked" should exist
     And the element "#edit-super-admin-access-products-page" with the attribute "checked" and the value "checked" should exist
     And the element "#edit-super-admin-access-projects-page" with the attribute "checked" and the value "checked" should exist

  Scenario Outline: The Admin role keeps the <type> content
    When I navigate to "/admin/people/permissions/admin"
    Then the element "#edit-admin-create-<type>-content" with the attribute "checked" and the value "checked" should exist
     And the element "#edit-admin-edit-own-<type>-content" with the attribute "checked" and the value "checked" should exist
     And the element "#edit-admin-edit-any-<type>-content" with the attribute "checked" and the value "checked" should exist
     And the element "#edit-admin-delete-own-<type>-content" with the attribute "checked" and the value "checked" should exist
     And the "#edit-admin-delete-any-<type>-content" checkbox should not be checked
     And the "#edit-admin-administer-nodes" checkbox should not be checked

    Examples:
      | type      |
      | product   |
      | component |
      | project   |
