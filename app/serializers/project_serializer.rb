class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :target_completion_date, :completion_date
end
