class ScientificSchool < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	has_many :research_efforts, dependent: :destroy
	has_paper_trail
end
