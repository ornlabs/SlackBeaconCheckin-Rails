class SlackPostsController < ApplicationController
	skip_before_filter  :verify_authenticity_token

	def index
	end

	def show
		@slack_post = SlackPost.find(params[:id])
	end

	def new
	end

	def create_entry

		@slack_post = SlackPost.new(slack_post_params)
		
		if @slack_post.save
			render status: 200, json: @slack_post
		else
			render :new, status: 500
		end

    post_to_integrations('@%2$s just entered %1$s' % [@slack_post.location, @slack_post.name])
	end

	def create_exit

		@slack_post = SlackPost.new(slack_post_params)

		if @slack_post.save
			render status: 200, json: @slack_post
		else
			render :new, status: 500
		end 

    post_to_integrations('@%2$s just left %1$s' % [@slack_post.location, @slack_post.name])
	end


	private
		def slack_post_params
			params.require(:slack_post).permit(:name, :location)
		end

    def post_to_integrations(message) 
      SlackIntegration.all.each { |integration| 
        response = HTTParty.post(
          integration.hook_url,
          :body => {'text' => message}.to_json)
      }
    end
end
