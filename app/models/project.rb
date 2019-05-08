class Project < ApplicationRecord

  belongs_to :user
  belongs_to :client
  has_many :comments

  validates :name, :description, :client, presence: true
  validate :target_date_cannot_be_greater_than_completion_date

  def target_date_cannot_be_greater_than_completion_date
    if target_completion_date > completion_date
      errors.add(:target_completion_date, "can't be greater than completion date")
    end
  end

  def format_target_date
    if target_completion_date
      target_completion_date.strftime("%m/%d/%Y")
    end
  end

  def format_completed_date
    if completion_date
      completion_date.strftime("%m/%d/%Y")
    end
  end

end
