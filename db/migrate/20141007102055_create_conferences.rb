class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.text :name, null: false
      t.text :country
      t.text :city
      t.date :start
      t.date :finish
      t.integer :year, null: false
      t.text :ctype, null: false
      t.string :creator_login
      t.text :creator_data

      t.timestamps
    end
    reversible do |dir|
      dir.up do
				execute <<-SQL
					ALTER TABLE conferences
          ADD CONSTRAINT year_limit
          CHECK (year <= CAST(EXTRACT(year from now()) as Integer));
				SQL
				execute <<-SQL1
					ALTER TABLE conferences
          ADD CONSTRAINT ctype_check
				  CHECK (ctype IN ('международная','на базе вуза','региональная','всероссийская', 'другое'));		
				SQL1
			end
			dir.down do
			end
		end
  end
end
