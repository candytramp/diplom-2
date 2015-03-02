class CreateScientificSchools < ActiveRecord::Migration
  def change
    create_table :scientific_schools do |t|
      t.string :name
			t.index :name, unique: true
      t.timestamps
    end
  end
end
