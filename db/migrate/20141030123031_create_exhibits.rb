class CreateExhibits < ActiveRecord::Migration
  def change
    create_table :exhibits do |t|
      t.text :name,      null: false
      t.integer :year,   null: false
      t.references :exhibition, index: true,   null: false

      t.timestamps
    end

		reversible do |dir|
      dir.up do
        'ALTER TABLE exhibits ADD FOREIGN KEY (exhibition_id) REFERENCES exhibitions(id)' 
				execute <<-SQL
          ALTER TABLE exhibits
		 		 	ADD CONSTRAINT year_max_value
		  		CHECK (year <= CAST(EXTRACT(year from now()) as Integer));
	    	SQL
      end
    end
  end
end
