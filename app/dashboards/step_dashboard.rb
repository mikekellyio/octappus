require "administrate/base_dashboard"

class StepDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    title: Field::String,
    content: Field::Text,
    detail_steps: Field::HasMany,
    parent: Field::BelongsTo.with_options(class_name: "Step"),
    children: Field::HasMany.with_options(class_name: "Step"),
    awards: Field::HasMany,
    completed_by: Field::HasMany.with_options(class_name: "Child"),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :title,
    :awards,
    :parent,
    :children,
    :completed_by,
    :detail_steps,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :awards,
    :completed_by,
    :detail_steps,
    :parent,
    :children,
    :title,
    :content,
  ]
end
