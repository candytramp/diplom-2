class CreateTheses < ActiveRecord::Migration
  def change
    create_table :theses do |t|
      t.references :person, index: true, null: false
      t.text :speciality, null: false
      t.text :council
      t.text :theme, null: false
      t.string :ttype, limit: 32, null: false
      t.integer :year, null: false
      t.text :in_time
      t.date :defence_date, null: false
      t.string :council_code, limit: 16

      t.timestamps
    end
    
    reversible do |dir|
     dir.up do
 	    execute <<-SQL
     		ALTER TABLE theses
      	ADD CONSTRAINT ttype_limit
      	CHECK (LENGTH(ttype) > 0 AND LENGTH(ttype) <= 32 );
      SQL
      execute <<-SQL1
      	ALTER TABLE theses
        ADD CONSTRAINT council_code_limit
        CHECK (LENGTH(council_code) > 0 AND LENGTH(council_code) <= 16 );
      SQL1
      
       execute <<-SQL2
      	ALTER TABLE theses
		 		ADD CONSTRAINT year_max_value
		 		CHECK (year <= CAST(EXTRACT(year from now()) as Integer));
	    SQL2
	      
	    execute <<-SQL4
			   ALTER TABLE theses
		 		 ADD CONSTRAINT ttype_check
		 		 CHECK (ttype IN ('кандидатская','докторская'));	
	    SQL4
	    execute <<-SQL5
			   ALTER TABLE theses
		 		 ADD CONSTRAINT in_time_check
		 		 CHECK (in_time IN ('не позднее окончания аспирантуры','не позднее 1 года после окончания аспирантуры'));	
	    SQL5
     'ALTER TABLE theses ADD FOREIGN KEY (person_id) REFERENCES people(id)' 
      end
    end

  end
end
