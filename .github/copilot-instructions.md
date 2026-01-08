# Copilot Instructions for Hair Salon Rails App

## Project Overview
A Rails 8.1 luxury day spa management application using PostgreSQL, Hotwire (Turbo + Stimulus), with TailwindCss and modern asset pipeline (Propshaft). The codebase is in early stage with core models being scaffolded.

## Architecture & Data Model

### Core Entities
- **Employee**: Salon staff with `name` and `bio` fields
- **Service**: Salon services with STI (`type` field) - uses single table inheritance for service types
  - Accepts nested attributes for related `staffs` and `appointments`

### Database
- PostgreSQL backend (see [config/database.yml](config/database.yml))
- Migrations auto-generated in `db/migrate/`, schema in [db/schema.rb](db/schema.rb)
- SQLite3 fallback for development if needed

### Key Models Pattern
- Models live in [app/models/](app/models/) extending `ApplicationRecord`
- Fixtures defined in [test/fixtures/](test/fixtures/) (e.g., employees.yml, services.yml)
- Relationships not yet fully implemented - Service model references `staffs` and `appointments` but associations aren't defined yet

## Frontend Stack
- **Hotwire**: Turbo Rails for SPA-like behavior, Stimulus for lightweight JS
- **Asset Pipeline**: Propshaft (Rails 8 default), not Sprockets
- **Import Maps**: ES modules with [config/importmap.rb](config/importmap.rb)
- **Stimulus Controllers**: [app/javascript/controllers/](app/javascript/controllers/) - one controller per feature
- **JavaScript**: Bundled at [app/javascript/application.js](app/javascript/application.js)

## Essential Development Commands
```bash
bin/dev          # Runs Procfile.dev - starts dev server, CSS/JS watchers, job queue
bin/rails s      # Start Rails server (port 3000)
bin/rake db:migrate    # Run pending migrations
bundle exec rspec       # Run full RSpec test suite
bundle exec rspec spec/models       # Run model specs only
bundle exec rspec spec/system       # Run system tests (Capybara + Selenium)
bin/rubocop -A   # Fix style issues (Rails Omakase ruleset)
bin/brakeman     # Security scanning
bin/bundler-audit # Check gem vulnerabilities
```

## Testing Approach
- **Test Framework**: RSpec with Capybara for system tests
- **Fixtures**: Factory pattern (FactoryBot) for test data generation
- **Test File Locations**: 
  - Unit: `spec/models/` (e.g., `spec/models/employee_spec.rb`)
  - System: `spec/system/` (Capybara + Selenium)
  - Controllers: `spec/controllers/`
- **Spec Files**: Use `describe`/`context`/`it` blocks; one spec file per model/controller

## Code Conventions

### Rails 8.1 Specifics
- **Zeitwerk Autoloading**: No explicit requires needed; files in `app/` auto-loaded
- **Modern Browsers Only**: ApplicationController enforces webp, web push, CSS nesting support
- **Solid Gems**: Using solid_cache, solid_queue, solid_cable for self-hosted alternatives

### Naming & File Organization
- Controllers in [app/controllers/](app/controllers/), inherit from ApplicationController
- Models in [app/models/](app/models/), inherit from ApplicationRecord
- Concerns in `app/models/concerns/` and `app/controllers/concerns/` for shared logic
- Views in [app/views/](app/views/) organized by controller name

### Routes
- [config/routes.rb](config/routes.rb) currently minimal (just health check `/up`)
- RESTful convention expected for new resources (resources :employees, :services)
- No API namespace yet - structure as needed for future mobile app

## Critical Areas Needing Development
1. **Routes**: Add RESTful routes for Employee and Service resources
2. **Associations**: Complete Service ↔ Staff and Appointment relationships
3. **Controllers**: Add CRUD actions for employees/services
4. **Validations**: Strengthen model validations beyond name presence
5. **Views**: Scaffold ERB templates with Hotwire patterns

## Deployment & Environment
- **Docker Support**: Dockerfile included; Kamal gem configured for deployment
- **Environment Config**: [config/environments/](config/environments/) - check development.rb vs production.rb
- **Credentials**: Use `RAILS_MASTER_KEY` for decrypting [config/credentials.yml.enc](config/credentials.yml.enc)
- **Puma**: Production web server configured in [config/puma.rb](config/puma.rb)

## When Adding Features
1. Always add migrations for schema changes (rails generate migration)
2. Write fixtures in YAML for model tests
3. Use Stimulus for JS interactions, not inline scripts
4. Keep views DRY with partials in [app/views/layouts/](app/views/layouts/)
5. Run `bin/rails db:schema:load` after migrations to verify schema integrity
