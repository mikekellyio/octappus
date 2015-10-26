require 'rails_helper'

RSpec.describe "admin/organizations/new", type: :view do
  before(:each) do
    assign(:admin_organization, Admin::Organization.new(
      :name => "MyString"
    ))
  end

  it "renders new admin_organization form" do
    render

    assert_select "form[action=?][method=?]", admin_organizations_path, "post" do

      assert_select "input#admin_organization_name[name=?]", "admin_organization[name]"
    end
  end
end
