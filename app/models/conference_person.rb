class ConferencePerson < ActiveRecord::Base
  belongs_to :conference
  belongs_to :person

	serialize :details
	has_paper_trail

  validates :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :inclusion => {:in => [true, false]}
	validates :conference, :person, presence: true
 	validates :conference, uniqueness: {scope: :person} 
end
