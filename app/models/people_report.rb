class PeopleReport < ActiveRecord::Base
  belongs_to :report
  belongs_to :person

	serialize :details
	has_paper_trail

  validates :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :inclusion => {:in => [true, false]}
	validates :report, :person, presence: true
 	validates :report, uniqueness: {scope: :person} 
end
