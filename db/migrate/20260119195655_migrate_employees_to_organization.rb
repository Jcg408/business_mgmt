class MigrateEmployeesToOrganization < ActiveRecord::Migration[8.1]
  def up
    # Add organization_id to employees
    add_reference :employees, :organization, type: :uuid, foreign_key: true
    
    # Migrate existing data
    # 1. Update employees with organization from their business
    execute <<-SQL
      UPDATE employees
      SET organization_id = (
        SELECT organization_id FROM businesses WHERE businesses.id = employees.business_id
      )
      WHERE business_id IS NOT NULL;
    SQL
    
    # 2. Create business_employees records from existing employee.business_id
    execute <<-SQL
      INSERT INTO business_employees (id, business_id, employee_id, role, primary_location, active, created_at, updated_at)
      SELECT 
        gen_random_uuid(),
        business_id, 
        id as employee_id, 
        role, 
        true as primary_location, 
        true as active,
        created_at,
        updated_at
      FROM employees
      WHERE business_id IS NOT NULL;
    SQL
    
    # 3. Remove old business_id and role columns from employees
    remove_index :employees, :business_id if index_exists?(:employees, :business_id)
    remove_index :employees, :role if index_exists?(:employees, :role)
    remove_foreign_key :employees, :businesses if foreign_key_exists?(:employees, :businesses)
    remove_column :employees, :business_id
    remove_column :employees, :role
  end

  def down
    # Add back business_id and role to employees
    add_reference :employees, :business, type: :uuid, foreign_key: true
    add_column :employees, :role, :integer, default: 0, null: false
    add_index :employees, :role
    
    # Restore employee business_id from primary business_employee record
    execute <<-SQL
      UPDATE employees
      SET business_id = (
        SELECT business_id 
        FROM business_employees 
        WHERE business_employees.employee_id = employees.id 
        AND business_employees.primary_location = true
        LIMIT 1
      );
      
      UPDATE employees
      SET role = (
        SELECT role 
        FROM business_employees 
        WHERE business_employees.employee_id = employees.id 
        AND business_employees.primary_location = true
        LIMIT 1
      );
    SQL
    
    # Remove organization_id from employees
    remove_reference :employees, :organization
  end
end
