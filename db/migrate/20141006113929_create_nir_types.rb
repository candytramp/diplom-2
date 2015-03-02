class CreateNirTypes < ActiveRecord::Migration
  def change
    create_table :nir_types do |t|
      t.string :name, limit: 30, null: false
			t.index :name, unique: true
      t.timestamps
    end
  end
end
