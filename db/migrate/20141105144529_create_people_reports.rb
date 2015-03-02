class CreatePeopleReports < ActiveRecord::Migration
  def change
    create_table :people_reports do |t|
      t.references :report, index: true, null: false
      t.references :person, index: true, null: false
      t.string :old_lastname, null: false
      t.boolean :is_teacher
      t.boolean :is_staffteacher
      t.boolean :is_student
      t.boolean :is_postgrad
      t.text :details
			t.index [:report_id,:person_id], unique: true

      t.timestamps
    end
		reversible do |dir|
      dir.up do
 				execute <<-SQL
          ALTER TABLE people_reports
          ADD CONSTRAINT lastname_limit
          CHECK (LENGTH(old_lastname) > 0 AND LENGTH(old_lastname) <= 64 );
        SQL
        'ALTER TABLE people_reports ADD FOREIGN KEY (report_id) REFERENCES reports(id)'
				'ALTER TABLE people_reports ADD FOREIGN KEY (person_id) REFERENCES people(id)' 
      end
    end

  end
end
