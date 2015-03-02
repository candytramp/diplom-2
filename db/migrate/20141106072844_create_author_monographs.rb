class CreateAuthorMonographs < ActiveRecord::Migration  
   def change
    create_table :author_monographs  do |t|
      t.references :monograph, index: true, null: false
      t.references :person, index: true, null: false
      t.string :old_lastname, null: false
      t.boolean :is_teacher
      t.boolean :is_staffteacher
      t.boolean :is_student
      t.boolean :is_postgrad
      t.text :details
      t.integer :pages, null: false

		t.index [:monograph_id,:person_id], unique: true
      t.timestamps
    end

		reversible do |dir|
      dir.up do
      	execute <<-SQL
          ALTER TABLE author_monographs 
          ADD CONSTRAINT lastname_limit
          CHECK (LENGTH(old_lastname) > 0 AND LENGTH(old_lastname) <= 64 );
         SQL
        'ALTER TABLE author_monographs  ADD FOREIGN KEY (monograph_id) REFERENCES monographs(id)'
		  'ALTER TABLE author_monographs  ADD FOREIGN KEY (person_id) REFERENCES people(id)' 
      end
    end
  end
end
