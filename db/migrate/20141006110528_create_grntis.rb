class CreateGrntis < ActiveRecord::Migration
  def change
    create_table :grntis do |t|
      t.string :grnti, limit: 8, null: false
      t.text :name, null: false
			t.index :grnti, unique: true
      t.timestamps
    end

		reversible do |dir|
      dir.up do
        # add a CHECK constraint
        execute <<-SQL
          ALTER TABLE grntis
          ADD CONSTRAINT grnti_limit
          CHECK (LENGTH(grnti) <= 8 AND LENGTH(grnti)>=2);
        SQL
      end
      dir.down do
      end
    end
  end
end
