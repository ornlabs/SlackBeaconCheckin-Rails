class UuidsController < ApplicationController
  before_action :set_uuid, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:show, :index]

  # GET /uuids
  # GET /uuids.json
  def index
    @uuids = Uuid.all
    render json: {payload: @uuids}
  end

  # GET /uuids/1
  # GET /uuids/1.json
  def show
  end

  # GET /uuids/new
  def new
    if current_user.admin?
      @uuid = Uuid.new
    else
      render_404
    end
  end

  # GET /uuids/1/edit
  def edit
  end

  # POST /uuids
  # POST /uuids.json
  def create
    if current_user.admin?

      @uuid = Uuid.new(uuid_params)

      respond_to do |format|
        if @uuid.save
          format.html { redirect_to @uuid, notice: 'Uuid was successfully created.' }
          format.json { render :show, status: :created, location: @uuid }
        else
          format.html { render :new }
          format.json { render json: @uuid.errors, status: :unprocessable_entity }
        end
      end
    else 
      render_404
    end

  end

  # PATCH/PUT /uuids/1
  # PATCH/PUT /uuids/1.json
  def update
    if current_user.admin?
    respond_to do |format|
        if @uuid.update(uuid_params)
          format.html { redirect_to @uuid, notice: 'Uuid was successfully updated.' }
          format.json { render :show, status: :ok, location: @uuid }
        else
          format.html { render :edit }
          format.json { render json: @uuid.errors, status: :unprocessable_entity }
        end
      end
    else
      render_404
    end
  end

  # DELETE /uuids/1
  # DELETE /uuids/1.json
  def destroy
    if current_user.admin?
      @uuid.destroy
      respond_to do |format|
        format.html { redirect_to uuids_url, notice: 'Uuid was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      render_404
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uuid
      @uuid = Uuid.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def uuid_params
      params.require(:uuid).permit(:uuid, :location)
    end

    def render_404
      respond_to do |format|
        format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
        format.xml  { head :not_found }
        format.any  { head :not_found }
      end
    end

end
