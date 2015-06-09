require 'rails_helper'

RSpec.describe "uuids/index", type: :view do
  before(:each) do
    assign(:uuids, [
      Uuid.create!(
        :uuid => "MyText",
        :location => "MyText"
      ),
      Uuid.create!(
        :uuid => "MyText",
        :location => "MyText"
      )
    ])
  end

  it "renders a list of uuids" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
