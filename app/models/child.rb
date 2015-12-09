class Child < ActiveRecord::Base
#  belongs_to :club
  belongs_to :team

  validates_presence_of :first_name, :last_name

  has_many :associated_steps, inverse_of: :child
  has_many :completed_steps,
           -> { order(:rgt) },
           through: :associated_steps,
           class_name: "Step",
           source: :step

  has_many :award_children
  has_many :awards, through: :award_children
  has_many :completed_awards, class_name: "Award", through: :completed_steps, source: :awards

  def pending_awards
    completed_awards.where.not(id: award_ids)
  end
  def pending_award_ids
    completed_awards.where.not(id: award_ids).ids
  end

  def pending_steps
    pending = Step.order(:rgt)\
                  .where.not(id: completed_step_ids)
    if completed_steps.present?
      pending = pending.where("steps.rgt > ?", completed_steps.last.rgt)
    end
    pending
  end

  def pending_step_ids
    pending_steps.ids
  end

  def next_step
    pending_steps.first
  end

  def next_step_id= id
    next_step_id
  end

  def next_step_id
    next_step.id if next_step
  end

  def filtered_completed_steps
    completed_steps.where.not(id: completed_steps.leaves.ids)
  end

  def name
    "#{first_name} #{last_name}"
  end

  def team_name
    team.name if team.present?
  end

  def to_s
    name
  end

end
