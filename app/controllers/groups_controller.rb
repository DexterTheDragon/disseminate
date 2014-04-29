class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  respond_to :html, :json

  # GET /groups
  # GET /groups.json
  def index
    @groups = policy_scope(Group)
    respond_with @groups
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    respond_with @group
  end

  # GET /groups/new
  def new
    @group = Group.new
    respond_with @group
  end

  # GET /groups/1/edit
  def edit
    respond_with @group
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = current_user.groups.build(group_params)
    flash[:notice] = 'Group was successfully created.' if @group.save
    respond_with @group
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    flash[:notice] = 'Group was successfully updated.' if @group.update(group_params)
    respond_with @group
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_with @group
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
      authorize @group
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :description)
    end
end
