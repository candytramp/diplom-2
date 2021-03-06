class YearValueValidator < ActiveModel::Validator
  def validate(record)
    summary = 0
    if record.year_value.present?
      record.errors[:start_date] << 'Дата начала отсутствует' if !record.start_date.present?
      record.errors[:finish_date] << 'Дата окончания отсутствует' if !record.finish_date.present?
      record.year_value.each do |key, value|        
        if record.start_date.present?&&record.finish_date.present?&&(key.to_i < record.start_date.year || key.to_i > record.finish_date.year)
          record.errors[:year_value] << 'Год выходит за временной интервал'
        end
        summary += value.to_f 
      end
      record.errors[:year_value] << 'Сумма по годам превышает общий объем финансирования' if summary > record.full_value.to_f

    else
      record.errors[:year_value] << 'Отсутствует общая сумма финансирования'
    end
  end
end

class ResearchEffort < ActiveRecord::Base

  serialize :year_value
  serialize :creator_data
  validates_with YearValueValidator
  belongs_to :state_program
  belongs_to :grnti
  belongs_to :field
  belongs_to :nir_type
  belongs_to :source
  belongs_to :scientific_school
  has_many :documents, :as => :owner
  has_many :ois_requests
  has_many :licences
  has_many :people_research_efforts
  has_paper_trail
  validates :name,:state_program_id, :start_date, :finish_date,
            :grnti_id, :field_id, :nir_type_id, :source_id, 
            :scientific_school_id, presence: true
  validates :full_value,  numericality: { greater_than: 0, allow_nil: false }
  def human()
    "НИР: #{self.name}"
  end

  def ResearchEffort.models_human_name()
    "НИР"
  end

  def ResearchEffort.construct_data(research_effort_params)
    if !research_effort_params['year_value'].present? 
      return research_effort_params
    end 
    data = Hash[*(research_effort_params['year_value'].select{ |x| !x['year'].blank? }.map{ |x| 
          [x['year'], x['value']]}.flatten)]
    hash = research_effort_params.to_h
    hash['year_value'] = data
    hash
  end
end
