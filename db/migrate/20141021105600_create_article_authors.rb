class CreateArticleAuthors < ActiveRecord::Migration
  def change
    create_table :article_authors do |t|
      t.references :article, index: true, null: false
      t.references :person, index: true, null: false
      t.string :old_lastname, null: false, limit: 64
      t.boolean :is_teacher
      t.boolean :is_staffteacher
      t.boolean :is_student
      t.boolean :is_postgrad
      t.text :details

			t.index [:article_id,:person_id], unique: true
      t.timestamps
    end
		reversible do |dir|
      dir.up do
 				execute <<-SQL
          ALTER TABLE article_authors
          ADD CONSTRAINT lastname_limit
          CHECK (LENGTH(old_lastname) > 0 AND LENGTH(old_lastname) <= 64 );
        SQL
        'ALTER TABLE article_authors ADD FOREIGN KEY (article_id) REFERENCES articles(id)'
				'ALTER TABLE article_authors ADD FOREIGN KEY (person_id) REFERENCES people(id)' 
      end
    end
  end
end


