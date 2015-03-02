class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
  		t.text :name, :null=>false
      t.text :source
      t.integer :start_page, :null=>false
      t.integer :finish_page, :null=>false
      t.text :link
      t.integer :year, :null=>false
      t.string :creator_login
      t.text :creator_data
			t.index :name, unique: true
      t.timestamps
    end

		reversible do |dir|
      dir.up do
        # add a CHECK constraint
        execute <<-SQL
          ALTER TABLE articles
          ADD CONSTRAINT start_finish_year_limit
          CHECK (start_page > 0 AND finish_page > 0 AND year > 0);
        SQL
        execute <<-SQL1
          ALTER TABLE articles
		 		 	ADD CONSTRAINT year_max_value
		  		CHECK (year <= CAST(EXTRACT(year from now()) as Integer));
 		 
	    SQL1
      end
      dir.down do
      end
    end
  end
end
