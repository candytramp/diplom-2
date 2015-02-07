class RoleUser < ActiveRecord::Base
  has_paper_trail
  
  belongs_to :user
  belongs_to :role
  
  serialize :value, Hash
  
  validates :user, presence: true
  validates :role_id, presence: true

  def is_admin?()
    self.role.name == 'admin' 
  end

  def RoleUser.construct_value(user_params)
    value = {}
    user_params['role_users_attributes'].each do |i, prm|
      if prm['value']['key'].blank?
        value[i] = {}
      else
        value[i] = {prm['value']['key'] => prm['value']['value']}
      end
    end
    hash = user_params.to_h
    hash['role_users_attributes'].each do |i, v|
      hash['role_users_attributes'][i]['value'] = value[i]
    end
    hash
  end
end
