module Api
  class OrganizationResource < JSONAPI::Resource
    attributes :name

    has_many :teams
  end
end
