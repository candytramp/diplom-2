class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.text :title
      t.references :conference, index: true, null: false
      t.string :creator_login
      t.text :creator_data

      t.timestamps
    end
    reversible do |dir|
      dir.up do
				'ALTER TABLE reports ADD FOREIGN KEY (conference_id) REFERENCES conferences(id)'
			end
			dir.down do
			end
		end
  end
end
