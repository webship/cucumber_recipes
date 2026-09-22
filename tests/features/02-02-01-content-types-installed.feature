Feature: Each Cucumber Recipes module installs its content type
  As a site administrator
  I want a Component, Product and Project content type with their fields
  So that testers can record the things they test

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: The three content types are listed
    When I navigate to "/admin/structure/types"
    Then I should see "Component"
     And I should see "Product"
     And I should see "Project"

  Scenario: The Component type carries its own fields
    When I navigate to "/admin/structure/types/manage/component/fields"
    Then I should see "field_component_name"
     And I should see "field_component_logo"
     And I should see "field_component_link"
     And I should see "field_description"
     And I should see "field_features"

  Scenario: The Product type carries its own fields
    When I navigate to "/admin/structure/types/manage/product/fields"
    Then I should see "field_product_name"
     And I should see "field_product_logo"
     And I should see "field_product_link"

  Scenario: The Project type carries its own fields
    When I navigate to "/admin/structure/types/manage/project/fields"
    Then I should see "field_project_name"
     And I should see "field_project_logo"
     And I should see "field_project_link"
