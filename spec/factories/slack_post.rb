#faker is a gem that randomizes data, for good testing
require 'faker'

#This defines the SlackPost class
FactoryGirl.define do
	factory :slack_post do |f|
		f.name { Faker::Name.name }
		f.location { Faker::Address.city }
	end
end