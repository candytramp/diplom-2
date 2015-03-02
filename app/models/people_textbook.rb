class PeopleTextbook < ActiveRecord::Base
  belongs_to :textbook
  belongs_to :person

	serialize :details
	has_paper_trail

  validates :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :inclusion => {:in => [true, false]}
	validates :textbook, :person, presence: true
 	validates :textbook, uniqueness: {scope: :person} 
end
