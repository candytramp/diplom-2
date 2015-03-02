class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.text :name, null: false
      t.string :code, limit: 8, null: false
			t.index :code, unique: true
      t.timestamps
    end

  reversible do |dir|
      dir.up do
        # add a CHECK constraint
        execute <<-SQL
          ALTER TABLE fields
          ADD CONSTRAINT code_limit
          CHECK (LENGTH(code) = 8);
        SQL
      end
      dir.down do
      end
    end
  end
end
