class Client < ApplicationRecord

  has_many :projects, dependent: :destroy
  has_many :users, through: :projects

  validates :company_name, presence: true
  validates_uniqueness_of :company_name, :case_sensitive => false
  validates :zip, length: { minimum: 5 }

  scope :client_with_most_projects, -> { joins(:projects).group(:company_name).count(:client_id).max_by{|k,v| v}}

  def self.client_with_most_projects_formatted
    self.client_with_most_projects.join(" => ")
  end

  def self.alphabetical
    self.order(:company_name)
  end


end
