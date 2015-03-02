class AddAttachmentPaperToDocuments < ActiveRecord::Migration
  def self.up
    change_table :documents do |t|
      t.attachment :paper
    end
  end

  def self.down
    remove_attachment :documents, :paper
  end
end
