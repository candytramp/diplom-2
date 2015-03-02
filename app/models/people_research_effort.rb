class PeopleResearchEffort < ActiveRecord::Base
  belongs_to :research_effort
  belongs_to :person

	serialize :details
	has_paper_trail

  validates :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :inclusion => {:in => [true, false]}
	validates :research_effort, :person, presence: true
 	validates :research_effort, uniqueness: {scope: :person} 
end
