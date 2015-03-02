class ExhibitPerson < ActiveRecord::Base
  belongs_to :exhibit
  belongs_to :person

	serialize :details
	has_paper_trail

  validates :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :inclusion => {:in => [true, false]}
	validates :exhibit, :person, presence: true
 	validates :exhibit, uniqueness: {scope: :person} 
end
