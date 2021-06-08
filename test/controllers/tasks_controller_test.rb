require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest

  setup do
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url

    @category = categories(:one)
    @task = tasks(:one)

    # follow_redirect!
    # assert_response :success
  end

  # Note: Find way to test task index in category show page
  # test "Should get all tasks of a category" do
  #   category = dummy_category
  #   get category_tasks_path(category)
  #   assert_response :success
  # end

  test "should get new category task page" do
    get new_category_task_path(@category)
    assert_response :success
  end

  test "should create new task and redirect" do 
    assert_difference -> {Task.count} do
      post category_tasks_path(@category), params: { task: {
        title: 'Test Task', 
        description: 'Task specifically made for testing',
        due_date: Date.tomorrow,
        priority: 3
      } }
    end

    assert_response :redirect
  end

  # test "should get category task show page" do
  #   category = dummy_category
  #   task = dummy_task(category)
  #   get category_task_path(@category, @task)

  #   # assert_response :success

  #   assert_template "categories/show"
  #   assert_template layout: "layouts/application", partial: "_show"
  # end

  test "should get category task edit page" do
    get edit_category_task_path(@category, @task)
    assert_response :success
  end

  test "should update category task data and redirect" do
    patch category_task_path(@category, @task), params: { task: {
      title: 'Test Task', 
      description: 'Task specifically made for testing',
      due_date: Date.today,
      priority: 3
    } }

    assert_response :redirect
  end

  test "should delete category task and redirect" do
    assert_difference -> {Task.count}, -1 do
      delete category_task_path(@category, @task)
    end
    assert_response :redirect
  end
  
end
