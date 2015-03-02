class AddArticleRefToReports < ActiveRecord::Migration
  def change
    add_reference :reports, :article, index: true
  end
  reversible do |dir|
    dir.up do
      'ALTER TABLE reports ADD FOREIGN KEY (article_id) REFERENCES articles(id)'
    end
  end
end
