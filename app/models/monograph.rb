class Monograph < ActiveRecord::Base
	has_paper_trail	
	has_many :documents, :as=> :owner
	has_many :author_monographs
	validates :name, :isbn, :publisher, :pages, :publish_year, presence: true
	validates :isbn, length: {maximum: 32}
	validates :publisher, inclusion: {in: ['Зарубежное издательство','Российское издательство: "Высшая школа"',
																				 'Российское издательство: вуза (организации)','Российское издательство']}
end
