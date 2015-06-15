class PresenceCheck
  def check(value)
    !value.blank?
  end
end

class YearCheck
  def check(value)
    year = value.to_i
    year > 0 &&  year <= Date.today.year
  end
end

class BooleanCheck
  def check(value)
    [true, false].include?(value)
  end
end

class SourceValidator < ActiveModel::Validator
  def initialize(value)
    @checks = {
      "name" => [PresenceCheck.new],
      "year" => [PresenceCheck.new, YearCheck.new],
      "output" => [PresenceCheck.new],
      "is_russian" => [BooleanCheck.new], 
      "in_rinc" => [BooleanCheck.new],
      "stype" => []
    }
  end

  def validate(record)
    result = ""
	if record.source.present?
    puts record.source.inspect
    if !record.source.has_key?(:stype) 
			  record.errors[:source] << "Тип докумнта не определен"
        puts 'underfiend'
    else
    case record.source[:stype]
      when 'журнал'
        result = validates_magazine(record.source) 
        if !result.blank?
          record.errors[:source] << "Неверное значение аттрибута #{result}"	
        end	 
        puts 'mag' 		  
			when 'сборник трудов'
				result = validates_papers(record.source) 
				if !result.blank?
					record.errors[:source] << "Неверное значение аттрибута #{result}"
		    end
        puts 'col' 	
			else
			  record.errors[:source] << 'Неверное значение типа документа'	
        puts 'wrong'
			end	
    puts "opiuy"
		end
	else
		record.errors[:source] << 'Отсутствует источник'			 
    puts "uguygy"
	end 
  end
  
  private
  
  def validates_magazine(hash)
    required_keys=[:name, :year, :stype, :output, :is_russian, :in_rinc]
    
    required_keys.each do |key|
    	if !hash.has_key?(key)
    		return "#{key} (missed attribute)"
      end			
    end
  	hash.each do |key, value|
  	  if value.kind_of?(String)
  		  value = value.strip 
  		  hash[key] = value.gsub(/\s+/,' ')
  		end
		  @checks[key.to_s].each do |check| 
  		  return key.to_s unless check.check(value)

  		end
  	end
 	  return ''
  end
  
  def validates_papers(hash)
    required_keys=[:name, :year, :stype]
    required_keys.each do |key|
    	if !hash.has_key?(key)
    		return "#{key} (пропущенный атрибут)"
        puts 'gbhnvfm'
      end			
    end
  	hash.each do |key, value|
  	  if value.kind_of?(String)
  		  value = value.strip 
  		  hash[key] = value.gsub(/\s+/,' ')
  	  end  
      Rails.logger.info("#{key} key сборник трудов")
	    @checks[key.to_s].each do |check| 
  		  return key.to_s unless check.check(value)
        puts 'azxwscedv'
  	  end
  	end
   puts "collection"
  	return ''
  end
   
end

class Article < ActiveRecord::Base
	include StringStrip
	
	validates_with SourceValidator
	before_validation :copy_year
	before_validation :convert_value_in_rinc_is_russian

	has_many :documents, :as=> :owner
	has_one :report	
	has_many :article_authors
	has_paper_trail
	serialize :source
	serialize :creator_data
	validates :name, presence: true, uniqueness: true
	validates :start_page, :finish_page, :year,
	      numericality: { only_integer: true, greater_than: 0, allow_nil: false }
	validates :year, numericality: {less_than_or_equal_to: Date.today.year} 
	
	def human()
    "Статья: #{self.name}"
  end

  def Article.models_human_name()
    "Статьи"
  end


  class << self
    def top_amount(ids, count = 7)
      #data = (2012 .. 2015).map { |year|
       # { label: "Количество статей в"+ "\n"+ year.to_s , value: 57^((year%10)**2) }
      #}
      data = [
        { label: "ИИТУ", value: 12},
        { label: "ИЭТС", value: 11},
        { label: "ТИ", value: 10},
        { label: "ЮИ", value: 8},
        { label: "ИЭУ", value: 9},
        { label: "СГТИ", value: 7},
        { label: "ИДО", value: 8}
      ]
      return data
    end

    def top_count(ids, count=5)
      data = [
        { label: "Сундукова О.А.", value: 3},
        { label: "Богданова А.Е.", value: 3},
        { label: "Карапаева Н.А.", value: 2},
        { label: "Грачев Д.Г.", value: 2},
        { label: "Сергиенко И.С.", value: 3}
      ]
     
      return data
    end
    def inst_by_year(ids, count=5)
      chart = {
        data: (2007 .. 2014).map { |year|
          { year: year.to_s, iitu: 2^((year%11)*3+12), iets: (5^((year%13)*3)-2).abs, ti: (2^((year%10)*3)+4).abs, ui: (2^((year%7)*3)+6).abs, ieu: (3^((year%23)*2-5)).abs, sgti:(2^((year%19)*2-2)).abs, ido:(7^((year%10)*3)+5).abs}
        },
        xkey: 'year',
        ykeys: ['iitu', 'iets', 'ti', 'ui','ieu', 'sgti', 'ido'],
        labels: ['Количество статей ИИТУ', 'Количество статей ИЭТС', 'Количество статей ТИ', 'Количество статей ЮИ', 'Количество статей ИЭУ', 'Количество статей СГТИ', 'Количество статей ИДО']
      }
      return chart
    end
  end


	private 
	
	def copy_year
		if self.source.present?
			self.year=self.source[:year].to_i
		else
			self.errors[:source] << 'Missed source value!'
		end
	end

    def convert_value_in_rinc_is_russian
		if self.source.present?
			if self.source[:in_rinc]!="0" && !self.source[:in_rinc].nil?
				self.source[:in_rinc] = true 
        puts '1qw2'
      else
				self.source[:in_rinc] = false
        puts '2wed4'
			end
			if self.source[:is_russian]!="0" && !self.source[:is_russian].nil?
        self.source[:is_russian] = true 
        puts '5frf4'
			else
				self.source[:is_russian] = false
        puts '7vf4' 
			end
		else
			self.errors[:source] << 'Missed source value!'		
      puts '9ferf3'
		end
    end

  def Article.set_source(params, article_params)
    source = Hash.new
    if params['source_type_col'] == 'on'
      source.merge!({:name => article_params['source']['col_name']})
      source.merge!({:year => article_params['source']['col_year']})
      source[:stype] = 'сборник трудов'
      
    elsif params['source_type_mag'] == 'on'
      h = {:name => article_params['source']['mag_name'], :year => article_params['source']['mag_year'], :output => article_params['source']['output'], :is_russian => article_params['source']['is_russian'], :in_rinc => article_params['source']['in_rinc'] }
      source = source.merge!(h)
      source[:stype] = 'журнал'
    end
    Rails.logger.info("#{source.inspect} set_source")
    return source
  end
end
 
