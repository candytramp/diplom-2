class Thesis < ActiveRecord::Base
  belongs_to :person
  has_paper_trail
  
  validates :ttype,  length: {maximum: 64}
  validates :council_code,  length: {maximum: 16}
  validates :person, :speciality, :ttype, :theme, :year, :defence_date, presence: true
  validates :year, :defence_date, numericality: {less_than_or_equal_to: Date.today.year} 
  validates :ttype, inclusion: {in: ['кандидатская','докторская']}
  validates :in_time, inclusion: {in: ['не позднее окончания аспирантуры','не позднее 1 года после окончания аспирантуры']}
end
