class CreateExhibitions < ActiveRecord::Migration
  def change
    create_table :exhibitions do |t|
      t.text :name, 					 null: false
      t.text :etype, 					 null: false
      t.text :country
      t.text :city
      t.date :start
      t.date :finish
      t.integer :year, 				 null: false
      t.string :creator_login
      t.text :creator_data
			t.index [:year, :name], unique: true
      t.timestamps
    end

		reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE exhibitions
          ADD CONSTRAINT etype_check
          CHECK (etype IN ('международная','на базе вуза','региональная','всероссийская', 'другая'));
        SQL
    		execute <<-SQL1
          ALTER TABLE exhibitions
		 		 	ADD CONSTRAINT year_max_value
		  		CHECK (year <= CAST(EXTRACT(year from now()) as Integer));
	    	SQL1
      end
    end
  end
end
