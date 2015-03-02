module StringStrip
  extend ActiveSupport::Concern 
  included do
    before_validation :process_field_string
  end    
  def process_field_string
    self.attributes.each do |name, value|
       if value.kind_of?(String)
         value.strip!
         self[name] = value.gsub(/\s+/,' ')
       end
    end
  end
end
