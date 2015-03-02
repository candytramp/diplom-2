class CreateExhibitPeople < ActiveRecord::Migration
  def change
    create_table :exhibit_people do |t|
      t.references :exhibit, index: true, null: false
      t.references :person, index: true, null: false
      t.string :old_lastname, null: false
      t.boolean :is_teacher
      t.boolean :is_staffteacher
      t.boolean :is_student
      t.boolean :is_postgrad
      t.text :details

			t.index [:exhibit_id,:person_id], unique: true
      t.timestamps
    end

		reversible do |dir|
      dir.up do
 				execute <<-SQL
          ALTER TABLE exhibit_people
          ADD CONSTRAINT lastname_limit
          CHECK (LENGTH(old_lastname) > 0 AND LENGTH(old_lastname) <= 64 );
        SQL
        'ALTER TABLE exhibit_people ADD FOREIGN KEY (exhibit_id) REFERENCES exhibits(id)'
				'ALTER TABLE exhibit_people ADD FOREIGN KEY (person_id) REFERENCES people(id)' 
      end
    end
  end
end
