class CreateResearchEfforts < ActiveRecord::Migration
  def change
    create_table :research_efforts do |t|
      t.text :name, null: false
      t.references :state_program, index: true, null: false
      t.date :start_date, null: false
      t.date :finish_date, null: false
      t.references :grnti, index: true, null: false
      t.references :field, index: true, null: false
      t.decimal :full_value, precision: 12, scale: 2
      t.text :year_value
      t.string :state_reg_number #limit: 100
      t.string :nir_number
      t.string :inventory_number
      t.references :nir_type, index: true, null: false
      t.references :source, index: true, null: false
      t.references :scientific_school, index: true, null: false
      t.boolean :is_nir, null: false
      t.index :name, unique: true
      t.string :creator_login
      t.text :creator_data

      t.timestamps
    end
    reversible do |dir|
      dir.up do
        'ALTER TABLE research_efforts ADD FOREIGN KEY (state_program_id) REFERENCES state_programs(id)'
        'ALTER TABLE research_efforts ADD FOREIGN KEY (grnti_id) REFERENCES grntis(id)'
        'ALTER TABLE research_efforts ADD FOREIGN KEY (field_id) REFERENCES fields(id)'
        'ALTER TABLE research_efforts ADD FOREIGN KEY (nir_type_id) REFERENCES nir_types(id)'
        'ALTER TABLE research_efforts ADD FOREIGN KEY (source_id) REFERENCES sources(id)'  
        'ALTER TABLE research_efforts ADD FOREIGN KEY (scientific_school_id) REFERENCES scientific_schools(id)'   
      end
    end
  end
end
