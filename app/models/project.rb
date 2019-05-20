class Project < ApplicationRecord

  belongs_to :user
  belongs_to :client
  has_many :comments

  validates :name, :description, :client, presence: true
  validate :target_completion_date_cannot_be_empty
  validate :target_completion_date_cannot_be_greater_than_completion_date

  def self.order_newest
    self.order(created_at: :desc)
  end

  def self.complete
    # raise params.inspect
    self.where.not(completion_date: nil).order(completion_date: :desc)
  end

  def self.incomplete
    self.where(completion_date: nil).order(target_completion_date: :asc)
  end

  def target_completion_date_cannot_be_empty
    if target_completion_date == nil
      errors.add(:target_completion_date, "can't be empty")
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
