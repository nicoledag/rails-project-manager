class Project < ApplicationRecord

  belongs_to :user
  belongs_to :client
  has_many :comments

  validates :name, :description, :client, presence: true

  def format_target_date
    target_completion_date.strftime("%m/%d/%Y")
  end

  def format_completed_date
    completion_date.strftime("%m/%d/%Y")
  end

end
