class Comment < ApplicationRecord

  belongs_to :project, optional: true
end
