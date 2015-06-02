class AddPageNumberToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :page_number, :integer
  end
end
