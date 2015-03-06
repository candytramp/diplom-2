class Source < ActiveRecord::Base
  validates :funding_source, presence: true, uniqueness: true
	has_many :research_efforts, dependent: :destroy
	has_paper_trail


  def human()
    "Источник финансирования: #{self.funding_source}"
  end

  def Source.models_human_name()
    "Источники финансирования"
  end
end
