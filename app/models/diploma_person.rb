class DiplomaPerson < ActiveRecord::Base
  belongs_to :diploma
  belongs_to :person

	serialize :details
	has_paper_trail

  validates :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :inclusion => {:in => [true, false]}
	validates :diploma, :person, presence: true
 	validates :diploma, uniqueness: {scope: :person} 
end
