class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  before_action :set_group

  # GET /services
  # GET /services.json
  def index
    @services = Service.all
  end

  # GET /services/1
  # GET /services/1.json
  def show
  end

  # GET /services/new
  def new
  end

  def new_type
    @service = "#{params[:type]}_service".classify.constantize.new
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  # POST /services.json
  def create
    @service = @group.services.build(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to [@group, @service.becomes(Service)], notice: 'Service was successfully created.' }
        format.json { render action: 'show', status: :created, location: [@group, @service.becomes(Service)] }
      else
        format.html { render action: 'new' }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to [@group, @service.becomes(Service)], notice: 'Service was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @service }
      else
        format.html { render action: 'edit' }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
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
