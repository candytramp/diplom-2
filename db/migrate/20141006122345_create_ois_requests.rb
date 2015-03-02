class CreateOisRequests < ActiveRecord::Migration
  def change
    create_table :ois_requests do |t|
      t.string :number, null: false
      t.date :priority, null: false
      t.text :author, 	null: false
      t.text :name	, 	null: false		
      t.text :object, 	null: false
      t.string :reg_agency, null: false
      t.references :research_effort, index: true
      t.string :status, null: false, default: 'российская'
      t.string :creator_login
      t.text :creator_data

      t.timestamps
    end
 		reversible do |dir|
      dir.up do
				execute <<-SQL
          ALTER TABLE ois_requests
          ADD CONSTRAINT status_check
          CHECK (status IN ('российская', 'международная'));
        SQL
        execute <<-SQL1
					ALTER TABLE ois_requests
          ADD CONSTRAINT object_check
          CHECK (object IN ('изобретение','полезная модель','промышленный образец','программа для ЭВМ','база данных','товарный знак'));
				SQL1
        'ALTER TABLE ois_requests ADD FOREIGN KEY (research_effort_id) REFERENCES research_efforts(id)'  
      end
      dir.down do
      end
    end
  end
end
