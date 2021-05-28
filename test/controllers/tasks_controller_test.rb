require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  # Note: Find way to test task index in category show page
  # test "Should get all tasks of a category" do
  #   category = dummy_category
  #   get category_tasks_path(category)
  #   assert_response :success
  # end

  test "should get new category task page" do
    category = dummy_category
    get new_category_task_path(category)
    assert_response :success
  end

  test "should create new task and redirect" do 
    category = dummy_category
    assert_difference -> {Task.count} do
      post category_tasks_path(category), params: { task: {
        title: 'Test Task', 
        description: 'Task specifically made for testing',
        due_date: Date.tomorrow,
        priority: 3
      } }
    end

    assert_response :redirect
  end

  test "should get category task show page" do
    category = dummy_category
    task = dummy_task(category)
    get category_task_path(category, task)

    assert_response :success
  end

  test "should get category task edit page" do
    category = dummy_category
    task = dummy_task(category)
    get edit_category_task_path(category, task)

    assert_response :success
  end

  test "should update category task data and redirect" do
    category = dummy_category
    task = dummy_task(category)

    patch category_task_path(category, task), params: { task: {
      title: 'Test Task', 
      description: 'Task specifically made for testing',
      due_date: Date.today,
      priority: 3
    } }

    assert_response :redirect
  end

  test "should delete category task and redirect" do
    category = dummy_category
    task = dummy_task(category)
    assert_difference -> {Task.count}, -1 do
      delete category_task_path(category, task)
    end
    assert_response :redirect
  end

  private

  def dummy_category
    category = Category.new
    category.title = "B-Baka!"
    category.description = "This description is one big baka! It's not like I like this category or anything"
    category.save
    return category
  end

  def dummy_task(category)
    task = Task.new
    task.title = "Dummy Task"
    task.description = "This task is a dummy"
    task.due_date = Date.tomorrow
    task.priority = 3
    task.completed = false
    task.category_id = category.id
    task.save
    return task
  end
  
end
