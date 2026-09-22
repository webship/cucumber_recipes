Feature: Each Cucumber Recipes module installs its listing page
  As a site administrator
  I want /components, /products and /projects to render their views
  So that testers have one place per entity kind to work from

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: The Components listing renders
    When I navigate to "/components"
    Then I should see "Components"
     And ".view-components" should be visible within 15 seconds

  Scenario: The Products listing renders
    When I navigate to "/products"
    Then I should see "Products"
     And ".view-products" should be visible within 15 seconds

  Scenario: The Projects listing renders
    When I navigate to "/projects"
    Then I should see "Projects"
     And ".view-projects" should be visible within 15 seconds

  Scenario: Each module adds its listing to the administration menu
    When I navigate to "/admin/structure/menu/manage/admin"
    Then I should see "Components"
     And I should see "Products"
     And I should see "Projects"

  Scenario: A Product node renders its full view display with the features block
    When I navigate to "/node/add/product"
     And I fill in "Name" with "Cucumber features block product"
     And I press "Save"
    Then I should see "Cucumber features block product"
     And ".node--type-product.node--view-mode-full" should be visible within 15 seconds
     And ".block-views-blockfeatures-features-block" should be visible within 15 seconds
     And ".view-features" should be visible within 15 seconds

  Scenario: A Project node renders its full view display with the features block
    When I navigate to "/node/add/project"
     And I fill in "Name" with "Cucumber features block project"
     And I fill in "field_project_link[0][uri]" with "https://webship.co" by its "name" attribute
     And I attach the file "project-logo.png" to "input[name='files[field_project_logo_0]']"
    Then "input[name='field_project_logo[0][alt]']" should be visible within 15 seconds
    When I fill in "field_project_logo[0][alt]" with "Cucumber project logo" by its "name" attribute
     And I press "Save"
    Then I should see "Cucumber features block project"
     And ".node--type-project.node--view-mode-full" should be visible within 15 seconds
     And ".block-views-blockfeatures-features-block" should be visible within 15 seconds
     And ".view-features" should be visible within 15 seconds

  Scenario: A Component node renders its full view display with the features block
    When I navigate to "/node/add/component"
     And I fill in "Name" with "Cucumber features block component"
     And I press "Save"
    Then I should see "Cucumber features block component"
     And ".node--type-component.node--view-mode-full" should be visible within 15 seconds
     And ".block-views-blockfeatures-features-block" should be visible within 15 seconds
     And ".view-features" should be visible within 15 seconds
