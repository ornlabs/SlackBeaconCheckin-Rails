require 'rails_helper'

RSpec.describe "uuids/show", type: :view do
  before(:each) do
    @uuid = assign(:uuid, Uuid.create!(
      :uuid => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
