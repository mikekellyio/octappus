class Step < ActiveRecord::Base
  validates_presence_of :title

  has_many :awards
  has_many :associated_children, class_name: "AssociatedStep", inverse_of: :step
  has_many :completed_by, through: :associated_children, class_name: "Child", source: :child

  has_many :detail_steps, foreign_key: :parent_id

  acts_as_nested_set counter_cache: :children_count
  include TheSortableTree::Scopes

  def to_s
    title
  end
end
