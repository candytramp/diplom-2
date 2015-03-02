class CreateExhibitionPeople < ActiveRecord::Migration
  def change
    create_table :exhibition_people do |t|
      t.references :exhibition, index: true, null: false
      t.references :person, index: true, null: false
      t.string :old_lastname, null: false
      t.boolean :is_teacher
      t.boolean :is_staffteacher
      t.boolean :is_student
      t.boolean :is_postgrad
      t.text :details
			t.index [:exhibition_id,:person_id], unique: true
      t.timestamps
    end
		reversible do |dir|
      dir.up do
 				execute <<-SQL
          ALTER TABLE exhibition_people
          ADD CONSTRAINT lastname_limit
          CHECK (LENGTH(old_lastname) > 0 AND LENGTH(old_lastname) <= 64 );
        SQL
        'ALTER TABLE exhibition_people ADD FOREIGN KEY (exhibition_id) REFERENCES exhibitions(id)'
				'ALTER TABLE exhibition_people ADD FOREIGN KEY (person_id) REFERENCES people(id)' 
      end
    end
  end
end
