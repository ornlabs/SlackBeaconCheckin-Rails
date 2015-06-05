# == Schema Information
#
# Table name: slack_posts
#
#  id         :integer          not null, primary key
#  name       :string
#  location   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SlackPost < ActiveRecord::Base
	validates :name, presence: true
	validates :location, presence: true
end
