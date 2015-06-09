require 'rails_helper'

RSpec.describe "uuids/index", type: :view do
  before(:each) do
    assign(:uuids, [
      Uuid.create!(
        :uuid => "MyText"
      ),
      Uuid.create!(
        :uuid => "MyText"
      )
    ])
  end

  it "renders a list of uuids" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
