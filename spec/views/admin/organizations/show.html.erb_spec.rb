require 'rails_helper'

RSpec.describe "admin/organizations/show", type: :view do
  before(:each) do
    @admin_organization = assign(:admin_organization, Admin::Organization.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
