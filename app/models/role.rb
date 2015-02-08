class Role < ActiveRecord::Base
  has_paper_trail
  
  has_many :role_users, dependent: :destroy

  validates :name, uniqueness: true, presence: true, length: {maximum: 32}

  def human()
    "Роль: #{self.name}"
  end

  def Role.models_human_name()
    "Роли"
  end
end
