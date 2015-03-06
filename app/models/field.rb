class Field < ActiveRecord::Base
	validates :code, :name, presence: true
	validates :code, uniqueness: true
	validates :code, length: {is: 8}
	has_many :research_efforts, dependent: :destroy
	has_paper_trail
	def human()
    "Область: #{self.name}"
  end
  def Field.models_human_name()
    "Области науки"
  end
end
