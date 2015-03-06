class StateProgram < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	has_many :research_efforts, dependent: :destroy
	has_paper_trail

  def human()
    "Федеральная программа: #{self.name}"
  end

  def StateProgram.models_human_name()
    "Федеральные программы"
  end
end
