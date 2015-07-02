class SlackIntegrationsController < ApplicationController
  before_action :set_integration, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  def index
    if current_user.admin?
      @slack_integrations = SlackIntegration.all
    else
      render_404
    end
  end

  def show
    render_404 unless current_user.admin?
  end

  def new
    if current_user.admin?
      @slack_integration = SlackIntegration.new
    else
      render_404
    end
  end

  def edit
    render_404 unless current_user.admin?
  end

  def create
    if current_user.admin?
      @slack_integration = SlackIntegration.new(slack_integration_params)

      if @slack_integration.save
        redirect_to @slack_integration, notice: 'Integration was successfully created.'
      else
        render :new
      end

    else 
      render_404
    end
  end

  def update
    if current_user.admin?
      if @slack_integration.update(slack_integration_params)
        redirect_to @slack_integration, notice: 'Integration was successfully updated.'
      else
        render :edit
      end
    else
      render_404
    end
  end

  def destroy
    if current_user.admin?
      @slack_integration.destroy
      redirect_to uuids_url, notice: 'Integration was successfully destroyed.'
    else
      render_404
    end
  end

  private
    def set_integration
      @slack_integration = SlackIntegration.find(params[:id])
    end

    def slack_integration_params
      params.require(:slack_integration).permit(:slack_integration, :hook_url)
    end

    def render_404
      respond_to do |format|
        format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
        format.xml  { head :not_found }
        format.any  { head :not_found }
      end
    end

end
