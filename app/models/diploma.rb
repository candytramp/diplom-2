class Diploma < ActiveRecord::Base
  REWARD_TYPES = [Article, Conference, Exhibit, Exhibition, Monograph, Report, Textbook]
  REWARD_TYPES_NAMES = Hash[REWARD_TYPES.map{|t| [t.name,t]}]
	serialize :creator_data
	has_paper_trail
  belongs_to :reward, polymorphic: true
	has_many :documents, :as=> :owner
	has_many :diploma_people
	validates :name, :year, presence: true
	validates :year, numericality: {less_than_or_equal_to: Date.today.year} 
  accepts_nested_attributes_for :documents, allow_destroy: true 

  def reward_typed_id
    return nil if reward.nil?
    return "#{reward_type}/#{reward_id}"
  end

  def reward_typed_id=(value)
    match_data = value.match(/^(?<type>\w+)\/(?<id>\d+)$/)
    if match_data
      reward_prototype = REWARD_TYPES_NAMES[match_data['type']]
      if reward_prototype
        self.reward = reward_prototype.find(match_data['id'].to_i)
      end
    end
  end

  def reward_name
    Diploma.reward_name(reward)
  end

  def Diploma.reward_name(reward)
    if reward
      if reward.class == Report || reward.class == Textbook
        return "#{reward.class.models_human_name}: #{reward.title}"
      else
        return "#{reward.class.models_human_name}: #{reward.name}"
      end
    end
    return ""
  end

  def human()
    "Диплом: #{self.name}"
  end

  def Diploma.models_human_name()
    "Дипломы"
  end
end
