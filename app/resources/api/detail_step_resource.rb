module Api
  class DetailStepResource < JSONAPI::Resource
    attributes :title, :content
    attributes :created_at, :updated_at

    has_one :parent, class_name: 'Step'
  end
end
