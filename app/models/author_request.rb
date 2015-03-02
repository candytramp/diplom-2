class AuthorRequest < ActiveRecord::Base
  belongs_to :ois_request
  belongs_to :person
  
  serialize :details
	has_paper_trail

  validates :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :inclusion => {:in => [true, false]}
	validates :ois_request, :person, presence: true
 	validates :ois_request, uniqueness: {scope: :person} 
end
