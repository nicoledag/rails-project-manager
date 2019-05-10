class Client < ApplicationRecord

  has_many :projects
  has_many :users, through: :projects

  validates :company_name, presence: true
  
  # validates :company_name, uniqueness: true
  validates_uniqueness_of :company_name, :case_sensitive => false
  # validates :phone, :zip, numericality: { only_integer: true }

end
