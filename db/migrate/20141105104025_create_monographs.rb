class CreateMonographs < ActiveRecord::Migration
  def change
    create_table :monographs do |t|
      t.string :isbn,    limit: 32, null: false
      t.text :name,      null: false
      t.text :publisher, null: false
      t.text :publisher_name
      t.integer :publish_year, null: false
      t.decimal :pages,  null: false, precision: 5, scale: 2


      t.timestamps
    end
		reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE monographs
          ADD CONSTRAINT publisher_check
          CHECK (publisher IN ('Зарубежное издательство','Российское издательство: "Высшая школа"',
								'Российское издательство: вуза (организации)','Российское издательство'));
        SQL
      end
    end
  end
end
