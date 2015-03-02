class LicencePerson < ActiveRecord::Base
  belongs_to :licence
  belongs_to :person

	serialize :details
	has_paper_trail

  validates :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :inclusion => {:in => [true, false]}
	validates :licence, :person, presence: true
 	validates :licence, uniqueness: {scope: :person} 
end
