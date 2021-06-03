require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @category = categories(:one)
  end

  test "should get categories index" do 
    get categories_path 
    assert_response :success
  end

  test "should get new category page" do
    get new_category_path
    assert_response :success
  end

  test "should create new user and redirect" do
    assert_difference -> {Category.count} do
      post categories_path, params: { category: {title: 'Testing', 
      description: 'Tasks related to testing'} }
    end
    assert_response :redirect
  end

  test "should get existing category" do
    get category_path(@category)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_path(@category)
    assert_response :success
  end

  test "should update category and redirect" do
    patch category_path(@category), params: { category: { title: 'Testing', 
      description: 'Tasks related to testing'} }
    assert_response :redirect
  end

  test "should delete" do
    assert_difference -> {Category.count}, -1 do
      delete category_path(@category)
    end
    assert_response :redirect
  end

end
