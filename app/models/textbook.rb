class Textbook < ActiveRecord::Base
	has_paper_trail	
	has_many :documents, :as=> :owner
	has_many :people_textbooks
	validates :title, :textbook_type, :isbn, :grif, :pages, :publisher, :publish_year, presence: true
	validates :publisher, inclusion: {in: ['Зарубежное издательство','Российское издательство: "Высшая школа"',
																				 'Российское издательство: вуза (организации)','Российское издательство']}
	validates :grif, inclusion: {in: ['гриф УМО или НМС', 'гриф Рособразования (Минобразования России)', 
																		'гриф других федеральных органов исполнительной власти', 'другой гриф', 'без грифа']}
	validates :textbook_type, inclusion: {in: ['учебник', 'учебное пособие', 'учебно-методическое пособие','методическое пособие']}
end
