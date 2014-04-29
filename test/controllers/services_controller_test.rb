require 'test_helper'

class ServicesControllerTest < ActionController::TestCase
  setup do
    user = User.create
    @controller.session[:user_id] = user.id
    # TODO: replace with FactoryGirl
    @group = groups(:one)
    @group.user_id = user.id
    @group.save
    @group.reload
    @service = services(:one)
  end

  # GET index
  test "should get index" do
    get :index, group_id: @group.id
    assert_response :success
    assert_not_nil assigns(:services)
  end

  # GET new
  test "should get new" do
    get :new, group_id: @group.id
    assert_response :success
  end

  test "should get new type" do
    get :new_type, group_id: @group.id, type: 'mailing_list'
    assert_response :success
  end

  # POST create
  test "should create service" do
    assert_difference('Service.count') do
      post :create, group_id: @group.id, service: { data: @service.data, type: @service.type }
    end

    assert_redirected_to group_service_path(assigns(:group), assigns(:service))
  end

  test "should respond to json" do
    post :create, group_id: @group.id, service: { data: @service.data, type: @service.type }, format: :json

    assert_equal %w(id type data created_at updated_at), json.keys
    assert_response :created
  end

  # GET show
  test "should show service" do
    get :show, group_id: @group.id, id: @service
    assert_response :success
  end

  # GET edit
  test "should get edit" do
    get :edit, group_id: @group.id, id: @service
    assert_response :success
  end

  # PUT update
  test "should update service" do
    patch :update, group_id: @group.id, id: @service, service: { data: @service.data, type: @service.type }
    assert_redirected_to group_service_path(assigns(:group), assigns(:service))
  end

  # DELETE destroy
  test "should destroy service" do
    assert_difference('Service.count', -1) do
      delete :destroy, group_id: @group.id, id: @service
    end

    assert_redirected_to group_services_path(assigns(:group))
  end
end
