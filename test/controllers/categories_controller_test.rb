require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
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
    category = dummy_category
    get category_path(category)
    assert_response :success
  end

  test "should get edit" do
    category = dummy_category

    get edit_category_path(category)
    assert_response :success
  end

  test "should get patch update" do
    category = dummy_category
    patch category_path(category), params: { category: { title: 'Testing', 
      description: 'Tasks related to testing'} }
    assert_response :redirect
  end

  test "should delete" do
    category = dummy_category
    assert_difference -> {Category.count}, -1 do
      delete category_path(category)
    end
    assert_response :redirect
  end

  # test "should get delete" do
  # end
  
  private

  def dummy_category
    category = Category.new
    category.title = "Test"
    category.description = "Test description"
    category.save
    return category
  end


end
