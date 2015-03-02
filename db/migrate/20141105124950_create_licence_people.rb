class CreateLicencePeople < ActiveRecord::Migration
  def change
    create_table :licence_people do |t|
      t.references :licence, index: true, null: false
      t.references :person, index: true, null: false
      t.string :old_lastname, null: false
      t.boolean :is_teacher
      t.boolean :is_staffteacher
      t.boolean :is_student
      t.boolean :is_postgrad
      t.text :details
			t.index [:licence_id,:person_id], unique: true
      t.timestamps
    end

    reversible do |dir|
      dir.up do
 				execute <<-SQL
          ALTER TABLE licence_people
          ADD CONSTRAINT lastname_limit
          CHECK (LENGTH(old_lastname) > 0 AND LENGTH(old_lastname) <= 64 );
        SQL
        'ALTER TABLE licence_people ADD FOREIGN KEY (licence_id) REFERENCES licences(id)'
				'ALTER TABLE licence_people ADD FOREIGN KEY (person_id) REFERENCES people(id)' 
      end
    end
  end
end
