class CreateLicences < ActiveRecord::Migration
  def change
    create_table :licences do |t|
      t.string :number, null: false, limit: 16
      t.date :reg_date, null: false
      t.string :type, null: false, limit: 32
      t.text :name, null: false 
      t.date :expiration_date

      t.string :req_number
      t.text :req_author
      t.text :req_object
      t.string :req_status
      t.string :reg_agency
			t.date :req_priority

      t.string :support 
      t.references :research_effort, index: true
      t.string :creator_login
      t.text :creator_data

      t.timestamps
    end
  reversible do |dir|
      dir.up do
         'ALTER TABLE licences ADD FOREIGN KEY (research_effort_id) REFERENCES research_efforts(id)'
				execute <<-SQL1
          ALTER TABLE licences
          ADD CONSTRAINT number_limit
          CHECK (LENGTH(number) > 0 AND LENGTH(number) < 16);
        SQL1
				execute <<-SQL
          ALTER TABLE licences
          ADD CONSTRAINT type_limit
          CHECK (LENGTH(type) > 0 AND LENGTH(type) < 32);
        SQL
      end
      dir.down do
      end
    end
  end
end
