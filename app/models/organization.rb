class Organization < ActiveRecord::Base
  has_many :teams

  def to_s
    name
  end
end
