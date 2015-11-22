class DetailStep < ActiveRecord::Base
  belongs_to :parent, class_name: "Step"

  def to_s
    title
  end
end
