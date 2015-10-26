require 'rails_helper'

RSpec.describe "admin/organizations/index", type: :view do
  before(:each) do
    assign(:admin_organizations, [
      Admin::Organization.create!(
        :name => "Name"
      ),
      Admin::Organization.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of admin/organizations" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
