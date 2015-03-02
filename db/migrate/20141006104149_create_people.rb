class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :last_name, null: false, limit: 64
      t.string :first_name, null: false, limit: 64
      t.string :second_name, limit: 64
      t.text :external_ids
      t.date :birthday

      t.timestamps
    end
  end
end
