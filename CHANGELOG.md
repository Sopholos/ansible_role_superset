# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/) and [Keep a changelog](https://github.com/olivierlacan/keep-a-changelog).

## [Unreleased](https://github.com/idealista/superset_role/tree/develop)

### :arrows_clockwise: Changed

- Bump default Superset version from `3.0.1` to `6.0.0`.
- Bump default Python from `3.10` to `3.11` (Superset 6 requires `>= 3.10`,
  `3.11` is recommended).
- Bump geckodriver from `0.29.1` to `0.34.0`.
- Install Superset with the per-release pip constraints file
  (`requirements/base.txt`) for reproducible installs.
- Bootstrap modern `pip`, `setuptools` and `wheel` inside the Superset
  virtualenv before installing `apache-superset`.
- Default `CSV_EXPORT` encoding changed to `utf-8-sig` to match the new
  Superset 6.0 default (Excel BOM compatibility).
- `superset set_database_uri` task switched to the modern `set-database-uri`
  CLI form.
- `apt` dependencies extended with `pkg-config`, `libpq-dev`, and
  `python<ver>-venv`.

### :heavy_plus_sign: Added

- New variables: `superset_pip_constraints_url`,
  `superset_venv_bootstrap_pip_packages`,
  `superset_screenshot_tiled_enabled`, `superset_drill_by`,
  `superset_dashboard_virtualization`,
  `superset_enable_broad_activity_access`,
  `superset_thumbnails_executors`, `superset_alert_reports_executors`,
  `superset_thumbnail_executors_username`, `superset_oauth_providers`,
  `superset_global_async_queries_cache_backend`,
  `superset_native_filter_default_row_limit`.

### :heavy_minus_sign: Removed

- `AUTH_OID` / `OPENID_PROVIDERS` (removed by Flask-AppBuilder 5.0 in
  Superset 6.0). Use `AUTH_OAUTH` with `OAUTH_PROVIDERS` instead.
- `THEME_OVERRIDES` (removed in Superset 6.0). Use the Ant Design v5
  theming system.
- `SUPERSET_WEBSERVER_DOMAINS` / domain sharding (removed in 6.0).
- Druid native-connector settings: `DRUID_TZ`, `DRUID_ANALYSIS_TYPES`,
  `DRUID_IS_ACTIVE`, `DRUID_METADATA_LINKS_ENABLED`, `DRUID_JOINS`.
- `APP_ICON_WIDTH` (custom logos auto-resized since 4.0).
- `SUPERSET_DASHBOARD_PERIODICAL_REFRESH_*` (no longer recognised).
- SIP-15 settings (removed in 4.0).
- CSV-to-Hive helpers: `CSV_TO_HIVE_UPLOAD_*`, `UPLOADED_CSV_HIVE_NAMESPACE`,
  `ALLOWED_USER_CSV_SCHEMA_FUNC`.
- `THUMBNAIL_SELENIUM_USER`, `ALERT_REPORTS_EXECUTE_AS`,
  `THUMBNAILS_EXECUTE_AS` — replaced by `*_EXECUTORS` lists.
- Standalone `ENABLE_JAVASCRIPT_CONTROLS` (now a feature flag only).
- Feature flags removed by Superset 4.0–6.0 and dropped from the template:
  `ENABLE_REACT_CRUD_VIEWS`, `ROW_LEVEL_SECURITY`, `VERSIONED_EXPORT`,
  `DISABLE_DATASET_SOURCE_EDIT`, `DISABLE_LEGACY_DATASOURCE_EDITOR`,
  `ENABLE_EXPLORE_JSON_CSRF_PROTECTION`, `ENABLE_TEMPLATE_REMOVE_FILTERS`,
  `REMOVE_SLICE_LEVEL_LABEL_COLORS`, `CLIENT_CACHE`, `DASHBOARD_CACHE`,
  `DASHBOARD_NATIVE_FILTERS`, `DASHBOARD_NATIVE_FILTERS_SET`,
  `DASHBOARD_CROSS_FILTERS`, `ENABLE_EXPLORE_DRAG_AND_DROP`, `KV_STORE`,
  `SHARE_QUERIES_VIA_KV_STORE`, `OMNIBAR`, `HORIZONTAL_FILTER_BAR`,
  `ALLOW_DASHBOARD_DOMAIN_SHARDING`.
- Removed the dead `email_reports.schedule_hourly` celerybeat entry.

### Migration notes

- Replace `superset_global_async_queries_redis_config` with
  `superset_global_async_queries_cache_backend` (now emitted as
  `GLOBAL_ASYNC_QUERIES_CACHE_BACKEND`).
- If you set `superset_auth_type: AUTH_OID`, switch to `AUTH_OAUTH` and
  populate `superset_oauth_providers` before re-running the role.

## [Previous] Support superset 1.5.0

- *[#19] Support superset 1.5.0* @jmonterrubio

### :hammer_and_wrench: Fixed
- *[#21] Fix sql lab error* @jmonterrubio

## [1.2.1](https://github.com/idealista/superset_role/tree/1.2.1) (2021-07-13)

[Full Changelog](https://github.com/idealista/superset_role/compare/1.2.0...1.2.1)

### :arrows_clockwise: Changed

- Update default superset install version to [1.2.0](https://github.com/apache/superset/releases/tag/1.2.0)

### :hammer_and_wrench: Fixed

- Fix wrong email configuration in molecule default scenery
- Fixed versions of `celery` and `flower` because newer versions broke superset installation
- Fix pip build problems

## [1.2.0](https://github.com/idealista/superset_role/tree/1.2.0) (2021-07-01)

[Full Changelog](https://github.com/idealista/superset_role/compare/1.1.1...1.2.0)

### :heavy_plus_sign: Added

- Option to add custom imports in superset_config.py

### :hammer_and_wrench: Fixed

- Fix typo missing quotation for mapbox token in superset_config template
- Use auth user registration when defined (no boolean evaluated)

## [1.1.1](https://github.com/idealista/superset_role/tree/1.1.1) (2021-06-24)

[Full Changelog](https://github.com/idealista/superset_role/compare/1.1.0...1.1.1)

### :hammer_and_wrench: Fixed

- Fix template path name for celery-flower service

## [1.1.0](https://github.com/idealista/superset_role/tree/1.1.0) (2021-06-21)

[Full Changelog](https://github.com/idealista/superset_role/compare/1.0.1...1.1.0)

- Many (good) changes

### :heavy_plus_sign: Added

- .gitattributes
- templates for service and  profile env set
- option to install firefox and geckodriver
- superset_config.py fully parametizable with ansible vars

### :arrows_clockwise: Changed

- tuned .gitignore
- tuned .yamllint
- bump Pipfile requirements
- Bump test-requirements
-  Realocated group_vars main.yml
- Add, remove and modificated vars main.yml
- Set needed molecule converge yml environment vars
- Updated Dockerfile to remove unnecessary exposed ports
- Updated molecule verify.yml with updated group_vars path
- Updated molecule vars for default scenario
- Updated molecule tests vars
- Update and renew config tasks (e.g: user creation)
- Install tasks reviewed and updated as we need
- Service tasks refactored
- Some task now are handlers for be more correct
- Service template refactored
- Superset_config python file template mega refactor
- Bump Changelog

### :hammer_and_wrench: Fixed

- Fix typo README.md

### :arrows_clockwise: Changed

- Install new 1.0 superset version
- superset_config.py template updated

### :heavy_plus_sign: Added

- New vars for SIP-15, emailing, chrome, etc.
- Some new tasks and checks
- Install chrome and chormedriver for reports

## [1.0.1](https://github.com/idealista/superset_role/tree/1.0.0) (2020-10-28)

[Full Changelog](https://github.com/idealista/superset_role/compare/1.0.0...1.0.1)

### :hammer_and_wrench: Fixed

- *[#3](https://github.com/idealista/superset_role/issues/3)* Fix updating config files @frantsao

## [1.0.0](https://github.com/idealista/superset_role/tree/1.0.0) (2020-10-19)

### :heavy_plus_sign: Added

- *First release* @ultraheroe
