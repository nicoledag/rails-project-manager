class Client < ApplicationRecord

  has_many :projects
  has_many :users, through: :projects

  validates :company_name, presence: true
  validates :company_name, uniqueness: true
  # validates :phone, :zip, numericality: { only_integer: true }

end
