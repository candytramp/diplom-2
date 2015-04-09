class TypeValidator < ActiveModel::Validator
	def validate(record)
		if record.ltype.present?	 
			if ['изобретение', 'промышленный образец','полезная модель'].include?(record.ltype)
				record.errors[:support] << 'Отсутствует подтип документа' if !record.support.present? 
			elsif ['программа для ЭВМ','база данных','товарный знак'].include?(record.ltype)
				#
			else
				record.errors[:ltype] << 'Не корректный тип документа'
			end

		else
			record.errors[:ltype] << 'Тип документа не определен'
		end
	end
end

class Licence < ActiveRecord::Base
	include StringStrip
	validates_with TypeValidator
	serialize :creator_data
	belongs_to :ois_request
	belongs_to :research_effort
	has_many :documents, :as => :owner
	has_many :licence_people
	has_paper_trail
	#:expiration_date,:req_number,:req_author, :req_object, :req_status, :reg_agency,:req_priority, :support
	validates :support, inclusion: {in: ['патент', 'поддержка патента'], allow_blank: true}
	validates :number, :ltype, :name, :reg_date, presence: true
	validates :number, length: {maximum: 16}
	validates :ltype, length: {maximum: 32}


	def human()
    "Лицензия: #{self.number}"
  end
  def Licence.models_human_name()
    "Лицензии"
  end

end

