class Exhibition < ActiveRecord::Base
	serialize :creator_data
	has_paper_trail	
	has_many :exhibits
  has_many :diplomas, :as=> :reward
  has_many :exhibition_people
	validates :name, :year, presence: true
	validates :name, uniqueness: {scope: :year, case_sensitive: false}
	validates :year, numericality: {less_than_or_equal_to: Date.today.year} 
	validates :etype, inclusion: {in: ['международная','на базе вуза','региональная','всероссийская', 'другая']}
end
