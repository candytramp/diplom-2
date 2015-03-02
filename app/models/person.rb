class Person < ActiveRecord::Base
	serialize :external_ids
	has_one :user
	has_many :article_authors
	has_many :diploma_people
	has_many :exhibition_people
	has_many :exhibit_people
	has_many :licence_people
	has_many :people_reports
	has_many :people_research_efforts
	has_many :people_textbooks
	has_many :author_monographs
	has_many :author_requests
	has_many :conference_people
	has_many :theses
	has_paper_trail
	include StringStrip
	validates :first_name, :last_name, presence: true, length: {maximum: 64}
	validates :second_name,  length: {maximum: 64}
 
  def full_name
    if !self.second_name.nil?
      self.last_name + ' ' + self.first_name + ' ' + self.second_name
    else
      self.last_name + ' ' + self.first_name
    end
  end
end
