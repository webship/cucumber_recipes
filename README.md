# Cucumber Recipes

Provides the content model the Cucumber Automated Functional Acceptance
Testing Management system tests against: the Component, Product and
Project content types, a listing page and a dashboard view for each, and
the user role recipes that decide who may reach them.


## Table of contents

- Features
- Requirements
- Installation
- Usage


## Features

Three modules ship in this package. Each one is self-contained and can
be installed on its own.

| Module | Content type | Listing page | Permission |
|--------|--------------|--------------|------------|
| `cucumber_components` | Component | `/components` | `access components page` |
| `cucumber_products` | Product | `/products` | `access products page` |
| `cucumber_projects` | Project | `/projects` | `access projects page` |

Each of the three installs the same set of things for its own entity
kind:

- A node type with a `field_<thing>_name`, `field_<thing>_logo` and
  `field_<thing>_link` field of its own, plus the shared
  `field_description` and `field_features` fields that Cucumber Core
  provides.
- Default, teaser and full view displays and a form display. The `full`
  display is built with Layout Builder and embeds Cucumber Core's
  `features` view block.
- Two views: the listing page above, which uses the admin theme, and a
  `dashboard_<thing>` view used as a dashboard block.
- A Pathauto pattern, so nodes get `/<thing>s/<title>` aliases.
- An administration menu link to the listing page, imported as default
  content by Drupal core's default content importer (see below).
- The `access <thing> page` permission.
- A `hook_form_FORM_ID_alter()` that attaches the `gherkin/gherkin-script`
  library to the node add and edit form.

Each module also carries eight Drupal recipes under `recipes/`, one per
Cucumber user role. Every one of them grants that module's
`access <thing> page` permission, and the recipes of the Admin,
Coordinator and Product Owner roles let the role keep the content: add
an item, change any item and delete the items it added itself:

- `user-role-super-admin` and `user-role-admin` run from
  `hook_install()`. They create the role if the site does not already
  have it, so the modules install on plain Drupal core as well as inside
  the Cucumber distribution.
- `user-role-tester`, `user-role-developer`, `user-role-analyst`,
  `user-role-coordinator`, `user-role-designer` and
  `user-role-product-owner` run from `hook_modules_installed()`, when
  the matching `cucumber_user_role_*` module is installed - in either
  order.

A ninth recipe, `default-content`, holds the administration menu link
under `recipes/default-content/content/` and also runs from
`hook_install()`. Recipes skip content that already exists by UUID, so
a site that imported the link earlier with the contrib Default Content
module does not get a second one.


## Requirements

Drupal core `^11.4 || ^12`, plus the packages listed in
`composer.json`:

- [Webpatches](https://www.drupal.org/project/webpatches)
- [Cucumber Core](https://www.drupal.org/project/cucumber_core)
- [Tracker](https://www.drupal.org/project/tracker)

Cucumber Core in turn brings in the media, taxonomy, workflow and
dashboard configuration these modules build on, including the
`views.view.features` view that the `full` display embeds. The contrib
[Default Content](https://www.drupal.org/project/default_content) module
is no longer needed; each module depends on core's Custom Menu Links
module instead.


## Installation

Install as you would normally install a contributed Drupal module, then
enable whichever of the three you need:

```
composer require drupal/cucumber_recipes
drush en cucumber_components cucumber_products cucumber_projects
```


## Usage

Add content at `/node/add/component`, `/node/add/product` or
`/node/add/project` and review it on `/components`, `/products` or
`/projects`. Grant `access <thing> page` to any further role at
`admin/people/permissions`; the role recipes only cover the Cucumber
roles.

Automated functional tests for these modules live in `tests/` and are
run with [webship-js](https://www.npmjs.com/package/webship-js); see
`tests/README.md`.
