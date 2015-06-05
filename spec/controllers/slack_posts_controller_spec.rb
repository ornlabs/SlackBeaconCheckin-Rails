require 'rails_helper'

RSpec.describe SlackPostsController, type: :controller do
	#These tests refer to the create_entry method
	describe "POST #create_entry" do

		#set params
		before :each do
			@params = attributes_for(:slack_post)
		end

    	it "slack_post_entry with proper parameters should succeed" do
      		post :create_entry, slack_post: @params
      		expect (expect(response.status).to eq(200)) 
    	end

    	it "slack_post_entry with improper name should fail" do
    		@params[:name] = nil
    		post :create_entry, slack_post: @params
    		expect (expect(response.status).to eq(500))
    	end

       	it "slack_post_entry with improper location should fail" do
    		@params[:location] = nil
    		post :create_entry, slack_post: @params
    		expect (expect(response.status).to eq(500))
    	end

    end

    describe "POST #create_exit" do

    	#set params
		before :each do
			@params = attributes_for(:slack_post)
		end

    	it "slack_post_exit with proper parameters should succeed" do
      		post :create_exit, slack_post: @params
      		expect (expect(response.status).to eq(200)) 
    	end

    	it "slack_post_exit with improper name should fail" do
    		@params[:name] = nil
    		expect(post :create_exit, slack_post: @params)
    		expect (expect(response.status).to eq(500))
    	end

   		it "slack_post_exit with improper location should fail" do
    		@params[:location] = nil
    		expect(post :create_exit, slack_post: @params)
    		expect (expect(response.status).to eq(500))
    	end

    end

end
