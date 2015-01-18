class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login, null: false, limit: 32
      t.text :info
      t.text :data
      t.index :login, unique: true

      t.timestamps null: false
    end
  end
end
