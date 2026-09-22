# Cucumber Recipes tests

[webship-js](https://www.npmjs.com/package/webship-js) (Playwright +
Cucumber-js) suite, run against plain Drupal core.

```bash
ddev drush site:install standard --account-name=webmaster --account-pass=dD.123123ddd -y
ddev drush en cucumber_core -y
# Cucumber Core's batch install leaves Media Directories UI's own config and
# the optional `views.view.features` uninstalled. The three modules below
# hard-depend on `views.view.features`, so re-run the config installer first.
ddev drush ev '\Drupal::service("config.installer")->installDefaultConfig("module","media_directories_ui"); \Drupal::service("config.installer")->installOptionalConfig();'
ddev drush en cucumber_components cucumber_products cucumber_projects -y
yarn install
./node_modules/.bin/playwright install --with-deps chromium
LAUNCH_URL="https://<project>.ddev.site" yarn test
```

CI: the `webship-js-test` job in `.gitlab-ci.yml`, which runs
`--tags "not @wip"`.
