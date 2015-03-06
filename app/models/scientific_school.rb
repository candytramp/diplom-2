class ScientificSchool < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	has_many :research_efforts, dependent: :destroy
	has_paper_trail

  def human()
    "Научная школа: #{self.name}"
  end

  def ScientificSchool.models_human_name()
    "Научные школы"
  end
end
