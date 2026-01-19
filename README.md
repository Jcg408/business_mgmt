# Beauty Business Management System

A comprehensive business management platform designed specifically for the beauty industry, including cosmetology and esthetics professionals. This Rails application provides multi-tenant capabilities at the organization level, allowing multiple businesses to be managed under a single organizational umbrella with flexible role-based access control.

## Overview

This system empowers beauty business organizations to:
- Manage multiple business locations under one organization
- Configure custom service offerings per business (haircuts, coloring, facials, waxing, etc.)
- Handle appointment scheduling with granular role-based permissions
- Track clients and their appointment history across locations
- Manage staff across multiple business locations
- Control inventory and supplier relationships
- Provide organization owners with centralized oversight

## Core Features

### Multi-Tenant Organization Structure
- **Three-tier hierarchy**: Organization → Businesses → Employees
- Organizations own and manage multiple business locations
- Each business operates with independent configuration while sharing organizational resources
- Organization owners have full oversight across all locations
- Business admins can manage their specific location
- Employees can work at multiple business locations with different roles at each

### Intelligent Landing Experience
- **Organization Owners**: Dashboard view with business selection cards, organizational statistics, and quick access to all locations
- **Business Employees**: Direct access to their primary business location dashboard with role-appropriate tools
- Dynamic navigation based on user permissions

### Role-Based Access Control
- **Organization Owner**: Full access to all businesses, can create/edit organizations and businesses
- **Business Admin**: Manage specific business location, staff, clients, and resources
- **Manager**: Reserved for future implementation
- **Staff**: Basic access to scheduling and client management at assigned location(s)

### Business Management
- Create and manage multiple business locations within an organization
- Each business can have unique:
  - Name and branding
  - Physical locations (primary, branch, billing, shipping)
  - Contact information (phone numbers with types: main, mobile, fax, work, home)
  - Active/inactive status
  - Employee roster with location-specific roles

### Staff Management
- Employees belong to organizations but work at specific businesses
- Many-to-many relationship: employees can work at multiple business locations
- Role assignment per business location (admin, manager, or staff)
- Primary business designation for default landing page
- Secure authentication with encrypted passwords

### Service Configuration
- Flexible service catalog that businesses can customize
- Support for various beauty services:
  - Hair services (cuts, styling, coloring, treatments)
  - Esthetic services (facials, waxing, skincare treatments)
  - Nail services
  - Spa services
  - And more...
- Service duration and pricing management (planned)
- Staff skill assignments (planned)

### Client Management
- Client profiles and contact information
- Appointment history (planned)
- Service preferences (planned)
- Notes and special requirements (planned)

### Inventory & Suppliers
- Product tracking with usage notes
- Supplier management with contact details
- Stock quantity monitoring
- Inventory levels and reordering (planned)

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

This application is in early-stage development with the foundation and permission system now established.

### Completed
- ✅ Core data models (Organization, Business, Employee, Client, Service, Product, Supplier, Location, Phone)
- ✅ PostgreSQL database schema with UUID primary keys
- ✅ Multi-tenant organization structure (Organization → Businesses → Employees)
- ✅ Business-Employee many-to-many relationship with roles
- ✅ Complete authentication system with session management
- ✅ Role-based access control and authorization system
- ✅ Organization owner permissions and dashboard
- ✅ Business CRUD operations with nested location and phone management
- ✅ Employee CRUD operations
- ✅ Client CRUD operations
- ✅ Organization management interface
- ✅ Dynamic landing pages based on user role
- ✅ Responsive UI with TailwindCSS
- ✅ Rails 8.1 modern asset pipeline (Propshaft)

### In Progress
- 🔄 Service catalog management
- 🔄 Business-specific service configuration

### Next Priority: Scheduling System (Phase 2)
- 📋 Calendar gem integration evaluation (Simple Calendar, FullCalendar, or ice_cube)
- 📋 Appointment model and booking workflow
- 📋 Staff availability management
- 📋 Role-based appointment booking permissions
- 📋 Conflict detection and double-booking prevention

### Planned Features
- 📋 Service duration and pricing
- 📋 Staff skill/service assignments
- 📋 Client appointment history
- 📋 Client self-service portal
- 📋 Online booking system
- 📋 Appointment reminders
- 📋 Reporting and analytics dashboard
- 📋 Payment processing integration

## Data Architecture

### Organization Model
- Root entity for multi-tenant system
- Has one owner (Employee)
- Has many businesses and employees
- Attributes: name, description, active status

### Business Model
- Belongs to an Organization
- Has many employees through business_employees join table
- Has polymorphic locations and phones
- Attributes: name, active status

### Employee Model
- Belongs to an Organization
- Has many businesses through business_employees
- Has secure password authentication
- Can work at multiple businesses with different roles
- One primary business for default landing

### BusinessEmployee Join Table
- Links employees to businesses with role and location info
- Role enum: staff (0), manager (1), admin (2)
- Primary location flag for employee's default business
- Active status flag

### Location Model (Polymorphic)
- Can belong to Business or Employee
- Type enum: primary, billing, shipping, home, branch
- Full address fields

### Phone Model (Polymorphic)
- Can belong to Business or Employee  
- Type enum: mobile, work, home, fax, main, other
- Phone number and optional extension

## Getting Started

### Prerequisites

- Ruby 3.2+
- PostgreSQL 14+
- Node.js (for asset compilation)
- Redis (optional, for production caching)


# Run with coverage
COVERAGE=true bundle exec rspec
```

### Code Quality

```bash
# Run linter (Rails Omakase ruleset)
bin/rubocop -A

# Security scanning
bin/brakeman

# Check for vulnerable dependencies
bin/bundler-audit
```

## Key Architectural Decisions

### Multi-Tenant Design
- Organizations are isolated - businesses cannot be transferred between organizations
- Employee roles are business-specific, allowing flexibility across locations
- Authorization checks verify both organization ownership and business-level permissions

### Security & Permissions
- Organization owners have full access to all their businesses
- Business admins can manage resources but cannot create new businesses
- Employees can only edit their own profiles unless they have admin rights
- All destructive actions require appropriate permission level

### UI/UX Patterns
- Organization owners see a business selection dashboard on login
- Business employees land directly on their primary business dashboard
- Dynamic navigation and role badges based on current context
- Confirmation dialogs for destructive actionsSetup the database:
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
✅ (Completed)
- Core data models and associations
- Organization → Business → Employee hierarchy
- Authentication and authorization system
- Complete CRUD operations for all entities
- Role-based permissions and access control
- Organization and business management interfaces
- Dynamic landing pages

### Phase 2: Scheduling System 📋 (Next Priority)
- Evaluate and integrate calendar solution
- Appointment model with booking workflow
- Staff availability configuration
- Role-based booking permissions
- Conflict detection and validation
- Appointment history tracking

### Phase 3: Business Configuration
- Service catalog customization per business
- Service pricing and duration management
- Staff skill/service assignments
- Business settings and preferences
- Advanced multi-location features

### Phase 4: Client Experience
- Client self-service portal
- Online booking interface
- Appointment reminders (email/SMS)
- Service history and preferences
- Loyalty program integration

### Phase 5: Business Intelligence
- Revenue and sales analytics
- Staff performance metrics
- Client retention insights
- Appointment trends and forecasting
- Inventory usage reporNext Priority)
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
