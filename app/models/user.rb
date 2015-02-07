class User < ActiveRecord::Base
  has_paper_trail
  
  has_many :role_users, inverse_of: :user, dependent: :destroy
  accepts_nested_attributes_for :role_users, allow_destroy: true

  validates :login, uniqueness: true, presence: true, length: {maximum: 32}
  validates_associated :role_users
  
  serialize :data, Hash
  
  def is_admin?()
    self.role_users.any?{ |x| x.role.name == 'admin' }
  end
  
  def User.construct_data(user_params)
    data = Hash[*(user_params['data'].select{ |x| !x['key'].blank? }.map{ |x| 
          [x['key'], x['value']]}.flatten)]
    hash = user_params.to_h
    hash['data'] = data
    hash
  end
end
