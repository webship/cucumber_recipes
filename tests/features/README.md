# Cucumber Recipes - webship-js feature scenarios

| File | Covers |
|------|--------|
| `01-01-01-users-login.feature` | Per-role login; the first scenario provisions the testing users. |
| `02-01-01-cucumber-recipes-modules-enabled.feature` | Components, Products and Projects, plus Cucumber Core and Tracker, are enabled. |
| `02-02-01-content-types-installed.feature` | The Component, Product and Project content types and their fields. |
| `03-01-01-listing-pages.feature` | `/components`, `/products` and `/projects` render, each adds an administration menu link, and a Component, Product and Project node each render their `full` view display with cucumber_core's features block. |
| `03-02-01-user-role-permissions.feature` | The `admin` and `super_admin` roles are created by the install recipes and granted each `access <thing> page` permission. |

No scenario is tagged `@wip`: the whole file runs in CI.
