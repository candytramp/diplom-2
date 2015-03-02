class CreateStatePrograms < ActiveRecord::Migration
  def change
    create_table :state_programs do |t|
      t.text :name, null: false
			t.index :name, unique: true
      t.timestamps
    end
  end
end
