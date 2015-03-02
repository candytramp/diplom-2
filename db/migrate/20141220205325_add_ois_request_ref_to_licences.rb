class AddOisRequestRefToLicences < ActiveRecord::Migration
  def change
    add_reference :licences, :ois_request, index: true
  end
  reversible do |dir|
    dir.up do
      'ALTER TABLE licences ADD FOREIGN KEY (ois_request_id) REFERENCES ois_requests(id)'
    end
  end
end
