class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name, null: false, limit: 32
      t.text :info
      t.index :name, unique: true

      t.timestamps null: false
    end
  end
end
