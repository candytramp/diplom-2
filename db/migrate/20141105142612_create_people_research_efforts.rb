class CreatePeopleResearchEfforts < ActiveRecord::Migration
  def change
    create_table :people_research_efforts do |t|
      t.references :research_effort, index: true, null: false
      t.references :person, index: true, null: false
      t.string :old_lastname, null: false
      t.boolean :is_teacher
      t.boolean :is_staffteacher
      t.boolean :is_student
      t.boolean :is_postgrad
      t.text :details
      t.decimal :person_value, null: false
      t.text :role, null: false
      
		t.index  [:research_effort_id,:person_id], unique: true, name: 'effort_person'
      t.timestamps
    end
		#rename_index :people_research_efforts, 'index_research_efforts_on_id', 'effort'
	  
	  reversible do |dir|
      dir.up do
 		  execute <<-SQL
          ALTER TABLE people_research_efforts
          ADD CONSTRAINT lastname_limit
          CHECK (LENGTH(old_lastname) > 0 AND LENGTH(old_lastname) <= 64 );
        SQL
        
        'ALTER TABLE people_research_efforts ADD FOREIGN KEY (research_effort_id) REFERENCES research_efforts(id)'
				'ALTER TABLE people_research_efforts ADD FOREIGN KEY (person_id) REFERENCES people(id)' 
      end
    end
    
  end
end
