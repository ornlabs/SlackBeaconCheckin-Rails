require 'rails_helper'

RSpec.describe "uuids/edit", type: :view do
  before(:each) do
    @uuid = assign(:uuid, Uuid.create!(
      :uuid => "MyText",
      :location => "MyText"
    ))
  end

  it "renders the edit uuid form" do
    render

    assert_select "form[action=?][method=?]", uuid_path(@uuid), "post" do

      assert_select "textarea#uuid_uuid[name=?]", "uuid[uuid]"

      assert_select "textarea#uuid_location[name=?]", "uuid[location]"
    end
  end
end
