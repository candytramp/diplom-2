class CreateTextbooks < ActiveRecord::Migration
  def change
    create_table :textbooks do |t|
      t.string :isbn,    	      limit: 32, null: false
      t.text :title,            null: false
      t.text :publisher,        null: false
      t.text :grif,             null: false
      t.integer :publish_year,  null: false
      t.decimal :pages,  				null: false, precision: 5, scale: 2
      t.text :textbook_type,    null: false

      t.timestamps
    end
		reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE textbooks
          ADD CONSTRAINT grif_check
          CHECK (grif IN ('гриф УМО или НМС', 'гриф Рособразования (Минобразования России)', 
								'гриф других федеральных органов исполнительной власти', 'другой гриф', 'без грифа'));
        SQL
        execute <<-SQL1
          ALTER TABLE textbooks
          ADD CONSTRAINT ttype_check
          CHECK (textbook_type IN ('учебник', 'учебное пособие', 'учебно-методическое пособие','методическое пособие'));
        SQL1
  			execute <<-SQL2
          ALTER TABLE textbooks
          ADD CONSTRAINT publisher_check
          CHECK (publisher IN ('Зарубежное издательство','Российское издательство: "Высшая школа"',
								'Российское издательство: вуза (организации)','Российское издательство'));
        SQL2
      end
    end
  end
end
