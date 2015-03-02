class Exhibit < ActiveRecord::Base
  belongs_to :exhibition
	has_paper_trail
	has_many :exhibit_people
	validates :name, :year, :exhibition, presence: true
	validates :year, numericality: {less_than_or_equal_to: Date.today.year} 
end
