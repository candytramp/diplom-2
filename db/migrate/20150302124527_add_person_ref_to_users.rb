class AddPersonRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :person, index: true
    reversible do |dir|
      dir.up do
        'ALTER TABLE users ADD FOREIGN KEY (person_id) REFERENCES people(id)'
      end
    end
  end
end
