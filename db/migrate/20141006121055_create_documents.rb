class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.text :description
      t.references :owner, polymorphic: true, index: true
      t.string :creator_login
      t.text :creator_data

      t.timestamps
    end
  end
end
