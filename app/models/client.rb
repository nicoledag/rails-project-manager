class Client < ApplicationRecord

  has_many :projects
  has_many :users, through: :projects

  validates :name, presence: true
  # validates :phone, :zip, numericality: { only_integer: true }

end
