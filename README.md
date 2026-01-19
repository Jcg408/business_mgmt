# Beauty Business Management System

A comprehensive business management platform designed specifically for the beauty industry, including cosmetology and esthetics professionals. This Rails application provides multi-tenant capabilities, allowing each business to configure their own services, staff, and scheduling preferences.

## Overview

This system empowers beauty businesses to:
- Manage multiple locations and staff members
- Configure custom service offerings (haircuts, coloring, facials, waxing, etc.)
- Handle appointment scheduling with role-based access control
- Track clients and their appointment history
- Manage inventory and supplier relationships
- Track products used in services

## Core Features

### Multi-Tenant Business Management
- Each business operates independently with its own configuration
- Business admins can customize what services they offer
- Support for multiple locations per business
- Custom role configuration for staff members

### Intelligent Scheduling System
- Role-based appointment scheduling
- Staff can book appointments based on their assigned permissions
- Calendar integration for viewing and managing appointments
- Conflict detection and availability management
- Client appointment history tracking

### Service Configuration
- Flexible service catalog that businesses can customize
- Support for various beauty services:
  - Hair services (cuts, styling, coloring, treatments)
  - Esthetic services (facials, waxing, skincare treatments)
  - Nail services
  - Spa services
  - And more...
- Service duration and pricing management
- Staff skill assignments (which staff can perform which services)

### Staff & Role Management
- Configurable roles and permissions
- Business admin can set what each role can do
- Employee profiles with service specializations
- Schedule and availability tracking

### Client Management
- Client profiles and contact information
- Appointment history
- Service preferences
- Notes and special requirements

### Inventory & Suppliers
- Product tracking
- Supplier management
- Inventory levels and reordering

## Technology Stack

- **Framework**: Rails 8.1
- **Database**: PostgreSQL
- **Frontend**: Hotwire (Turbo + Stimulus)
- **Styling**: TailwindCSS
- **Asset Pipeline**: Propshaft
- **Testing**: RSpec with Capybara
- **Background Jobs**: Solid Queue
- **Caching**: Solid Cache
- **WebSockets**: Solid Cable

## Current Status

🚧 **In Active Development** 🚧

This application is in early-stage development. Core models have been scaffoled and the foundation is being established.

### Completed
- ✅ Core data models (Business, Employee, Client, Service, Product, Supplier)
- ✅ Database schema setup
- ✅ Basic authentication structure
- ✅ Rails 8.1 modern asset pipeline

### In Progress
- 🔄 Role-based access control system
- 🔄 Business configuration interface
- 🔄 Service catalog management

### Planned
- 📋 Calendar/scheduling system integration
- 📋 Appointment booking workflow
- 📋 Staff availability management
- 📋 Client portal
- 📋 Reporting and analytics
- 📋 Payment processing integration

## Getting Started

### Prerequisites

- Ruby 3.2+
- PostgreSQL 14+
- Node.js (for asset compilation)
- Redis (optional, for production caching)

### Installation

1. Clone the repository:
```bash
git clone [repository-url]
cd business_mgmt
```

2. Install dependencies:
```bash
bundle install
```

3. Setup the database:
```bash
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed
```

4. Start the development server:
```bash
bin/dev
```

The application will be available at `http://localhost:3000`

### Running Tests

```bash
# Run full test suite
bundle exec rspec

# Run specific test types
bundle exec rspec spec/models
bundle exec rspec spec/system
bundle exec rspec spec/controllers
```

### Code Quality

```bash
# Run linter
bin/rubocop -A

# Security scanning
bin/brakeman

# Check for vulnerable dependencies
bin/bundler-audit
```

## Development Roadmap

### Phase 1: Foundation (Current)
- Core data models and associations
- Authentication and authorization
- Basic CRUD operations
- Role management system

### Phase 2: Scheduling (Next Priority)
- Calendar gem integration (evaluating Simple Calendar, FullCalendar, or ice_cube)
- Appointment booking workflow
- Staff availability management
- Conflict detection

### Phase 3: Business Configuration
- Service catalog customization interface
- Role and permission configuration
- Business settings and preferences
- Multi-location support

### Phase 4: Client Experience
- Client self-service portal
- Online booking
- Appointment reminders
- Service history

### Phase 5: Business Intelligence
- Reporting dashboard
- Revenue analytics
- Staff performance metrics
- Client retention insights

## Contributing

This is currently a private project under active development. Contribution guidelines will be established as the project matures.

## License

[License to be determined]

## Contact

[Your contact information]

---

**Note**: This README will be updated regularly as features are implemented and the project evolves.
