class Project < ApplicationRecord

  belongs_to :user
  belongs_to :client
  has_many :comments

  validates :name, :description, :client, :target_completion_date, presence: true
  validate :target_completion_date_cannot_be_greater_than_completion_date
  validate :completion_date_cannot_be_greater_than_current_date

  scope :order_newest, -> { order(created_at: :desc)}
  scope :complete, -> { where.not(completion_date: nil).order(completion_date: :desc) }
  scope :incomplete, -> { where(completion_date: nil).order(target_completion_date: :asc)}


  def completion_date_cannot_be_greater_than_current_date
    if completion_date != nil && completion_date > DateTime.now
      errors.add(:completion_date, "cannot be greater than current date")
    end
  end

  def target_completion_date_cannot_be_greater_than_completion_date
    if target_completion_date != nil && completion_date != nil && target_completion_date > completion_date
    errors.add(:target_completion_date, "can't be greater than completion date")
    end
  end

  def format_target_date
    if target_completion_date
      self.target_completion_date.strftime("%m/%d/%Y")
    end
  end

  def format_completed_date
    if completion_date
      self.completion_date.strftime("%m/%d/%Y")
    end
  end

end
