require 'rails_helper'

RSpec.describe "uuids/new", type: :view do
  before(:each) do
    assign(:uuid, Uuid.new(
      :uuid => "MyText"
    ))
  end

  it "renders new uuid form" do
    render

    assert_select "form[action=?][method=?]", uuids_path, "post" do

      assert_select "textarea#uuid_uuid[name=?]", "uuid[uuid]"
    end
  end
end
