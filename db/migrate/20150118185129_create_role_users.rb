class CreateRoleUsers < ActiveRecord::Migration
  def change
    create_table :role_users do |t|
      t.references :user, index: true, null: false
      t.references :role, index: true, null: false      
      t.text :value

      t.timestamps null: false
    end
    add_foreign_key :role_users, :users
    add_foreign_key :role_users, :roles
  end
end
