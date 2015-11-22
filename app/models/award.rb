class Award < ActiveRecord::Base
  belongs_to :step
  has_many :award_children
  has_many :children, through: :award_children

  def to_s
    name
  end
end
