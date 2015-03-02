class ArticleAuthor < ActiveRecord::Base
  belongs_to :article
  belongs_to :person
	serialize :details
	has_paper_trail

  validates :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :inclusion => {:in => [true, false]}
	validates :article, :person, presence: true
 	validates :article, uniqueness: {scope: :person} 
end

