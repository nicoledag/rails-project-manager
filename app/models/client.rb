class Client < ApplicationRecord

  has_many :projects
  has_many :users, through: :projects

  validates :company_name, presence: true
  validates_uniqueness_of :company_name, :case_sensitive => false
  validates :zip, length: { minimum: 5 }


  def self.alphabetical
    self.order(:company_name)
  end

end
