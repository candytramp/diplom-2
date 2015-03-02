class ExhibitionPerson < ActiveRecord::Base
  belongs_to :exhibition
  belongs_to :person

	serialize :details
	has_paper_trail

  validates :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :inclusion => {:in => [true, false]}
	validates :exhibition, :person, presence: true
 	validates :exhibition, uniqueness: {scope: :person} 
end
