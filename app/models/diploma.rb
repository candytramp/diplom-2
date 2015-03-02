class Diploma < ActiveRecord::Base
	serialize :creator_data
	has_paper_trail
  belongs_to :reward, polymorphic: true
	has_many :documents, :as=> :owner
	has_many :diploma_people
	validates :name, :year, presence: true
	validates :year, numericality: {less_than_or_equal_to: Date.today.year} 
end
