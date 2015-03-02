class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.text :funding_source, null: false
			t.index :funding_source, unique: true
      t.timestamps
    end
  end
end
