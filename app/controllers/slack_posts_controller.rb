class SlackPostsController < ApplicationController
	skip_before_filter  :verify_authenticity_token
	protect_from_forgery with: :null_session

	def index
	end

	def show
	end

	def new
	end

	def create_entry
		@slack_post = SlackPost.new(slack_post_params)
		if @slack_post.save
			render status: 200, json: @slack_post
		else
			render status: 500
		end 
  		response = HTTParty.post(
  				Rails.application.secrets.address,
  				:body => {"text" => '@%2$s just entered %1$s' % [@slack_post.location, @slack_post.name]
  				}.to_json)
	end

	def create_exit
		@slack_post = SlackPost.new(slack_post_params)
		if @slack_post.save
			render status: 200, json: @slack_post
		else
			render status: 500
		end 
  		response = HTTParty.post(
  				Rails.application.secrets.address,
  				:body => {"text" => '@%2$s just left %1$s' % [@slack_post.location, @slack_post.name]
  				}.to_json)
	end


	private
		def slack_post_params
			params.require(:slack_post).permit(:name, :location)
		end
end
