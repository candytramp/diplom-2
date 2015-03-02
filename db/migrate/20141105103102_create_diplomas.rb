class CreateDiplomas < ActiveRecord::Migration
  def change
    create_table :diplomas do |t|
      t.text :name, 							null: false
      t.date :issue_date
      t.text :issue_organization
      t.integer :year, 						null: false
      t.string :creator_login
      t.text :creator_data
      t.references :reward, polymorphic: true, index: true

      t.timestamps
    end
		reversible do |dir|
      dir.up do
				execute <<-SQL
          ALTER TABLE diplomas
		 		 	ADD CONSTRAINT year_max_value
		  		CHECK (year <= CAST(EXTRACT(year from now()) as Integer));
	    	SQL
      end
    end
  end
end
