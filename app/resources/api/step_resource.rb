module Api
  class StepResource < JSONAPI::Resource
    attributes :title, :content, :depth, :rgt, :lft
    attributes :created_at, :updated_at

    has_one :parent, class_name: 'Step'
    has_many :ancestors, class_name: 'Step'
    has_many :children, class_name: 'Step'
    has_many :siblings, class_name: 'Step'
    has_many :completed_by, class_name: 'Child'
    has_many :detail_steps

    def self.updatable_fields(context)
      super - [:depth, :rgt, :lft]
    end

    def self.creatable_fields(context)
      super - [:depth, :rgt, :lft]
    end
  end
end
