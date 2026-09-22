Feature: The Cucumber Recipes modules are enabled
  As a site administrator
  I want Cucumber Components, Products and Projects installed on plain Drupal
  So that the testing content model they ship is available

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: The three Cucumber Recipes modules are listed as enabled
    When I navigate to "/admin/modules"
    Then I should see "Cucumber Components"
     And I should see "Cucumber Products"
     And I should see "Cucumber Projects"
     And the element "#edit-modules-cucumber-components-enable" with the attribute "checked" and the value "checked" should exist
     And the element "#edit-modules-cucumber-products-enable" with the attribute "checked" and the value "checked" should exist
     And the element "#edit-modules-cucumber-projects-enable" with the attribute "checked" and the value "checked" should exist

  Scenario: The modules the Cucumber Recipes modules build on are enabled
    When I navigate to "/admin/modules"
    Then the element "#edit-modules-cucumber-core-enable" with the attribute "checked" and the value "checked" should exist
     And the element "#edit-modules-default-content-enable" with the attribute "checked" and the value "checked" should not exist
     And the element "#edit-modules-tracker-enable" with the attribute "checked" and the value "checked" should exist
