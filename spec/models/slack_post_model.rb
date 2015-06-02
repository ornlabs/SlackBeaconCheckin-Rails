# spec/models/slack_post.rb

require 'rails_helper'

describe SlackPost do
	it "has a valid factory" do
		expect(create(:slack_post)).to be_valid
	end

	it "is invalid without a name" do
		expect(build(:slack_post, name: nil)).not_to be_valid
	end

	it "is invalid without a location" do
		expect(build(:slack_post, location:nil)).not_to be_valid
	end
end