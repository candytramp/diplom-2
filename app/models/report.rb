class Report < ActiveRecord::Base
  belongs_to :conference
	serialize :creator_data
	belongs_to :article
	has_paper_trail
	has_many :people_reports
	has_many :documents, :as=> :owner
	validates :conference_id, presence: true
end
