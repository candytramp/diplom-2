class Conference < ActiveRecord::Base
  before_validation :copy_year
	has_many :reports
	has_many :conference_people
	serialize :creator_data
	has_paper_trail
	has_many :diplomas, :as=> :reward
	validates :name, :ctype, presence: true
	validates :ctype, inclusion: {in: ['международная','на базе вуза','региональная','всероссийская', 'другое']}
# validations on year, start and finish
  def human()
    "Конференция: #{self.name}"
  end

  def Conference.models_human_name()
    "Конференции"
  end

  def copy_year
    if self.start.present?
      self.year=self.start.year.to_i
    else
    end
  end
end
