module Api
class TeamResource < JSONAPI::Resource
  attributes :name, :created_at, :updated_at

  has_one :organization
  has_many :children
end
end
