class AuthorMonograph < ActiveRecord::Base
  belongs_to :monograph
  belongs_to :person
 
  serialize :details
	has_paper_trail

  validates :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :inclusion => {:in => [true, false]}
	validates :monograph, :person, presence: true
 	validates :monograph, uniqueness: {scope: :person} 
end
