class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  before_action :set_group

  respond_to :html, :json

  # GET /services
  # GET /services.json
  def index
    @services = Service.all
    respond_with @services
  end

  # GET /services/1
  # GET /services/1.json
  def show
    respond_with @service
  end

  # GET /services/new
  def new
    respond_with @service
  end

  def new_type
    @service = "#{params[:type]}_service".classify.constantize.new
  end

  # GET /services/1/edit
  def edit
    respond_with @service
  end

  # POST /services
  # POST /services.json
  def create
    @service = @group.services.build(service_params)
    flash[:notice] = 'Service was successfully created.' if @service.save
    respond_with [@group, @service.becomes(Service)] do |format|
      format.json { render :show, status: :created }
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    flash[:notice] = 'Service was successfully updated.' if @service.update(service_params)
    respond_with [@group, @service.becomes(Service)]
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to group_services_url(@group) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    def set_group
      @group = Group.find(params[:group_id])
      authorize @group, :edit?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:type, :data, :email_address)
    end
end
