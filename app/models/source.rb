class Source < ActiveRecord::Base
  validates :funding_source, presence: true, uniqueness: true
	has_many :research_efforts, dependent: :destroy
	has_paper_trail
end
