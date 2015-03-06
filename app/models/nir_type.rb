class NirType < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	has_many :research_efforts, dependent: :destroy
	has_paper_trail

  def human()
    "Тип НИР: #{self.name}"
  end

  def NirType.models_human_name()
    "Типы НИР"
  end
end
