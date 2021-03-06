require "administrate/base_dashboard"

class ChildDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    first_name: Field::String,
    last_name: Field::String,
    nickname: Field::String,
    birthday: Field::DateTime,
    team: Field::BelongsTo,
    avatar_hash: Field::String,
    completed_steps: Field::HasMany.with_options(class_name: "Step"),
    awards: Field::HasMany,
    completed_awards: Field::HasMany.with_options(class_name: "Award"),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :first_name,
    :last_name,
    :team,
    :awards
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :first_name,
    :last_name,
    :nickname,
    :birthday,
    :avatar_hash,
    :team,
    :completed_steps,
    :awards,
    :completed_awards,
  ]
end
