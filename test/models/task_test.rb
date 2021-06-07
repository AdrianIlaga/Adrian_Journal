require "test_helper"

class TaskTest < ActiveSupport::TestCase

  setup do
    @category1 = categories(:one)
    @category2 = categories(:two)
  end

  test "should not save new task without title" do
    task = Task.new
    task.description = "This task should not be added"
    task.due_date = Date.tomorrow
    task.priority = 5
    task.category_id = @category1.id 
    task.completed = false
    assert_not task.save, "Saved without task title"
  end

  test "task title should be unique per category" do
    task = Task.new
    task.title = "Same title"
    task.description = "This task should added"
    task.due_date = Date.tomorrow
    task.priority = 3
    task.category_id = @category1.id 
    task.completed = false
    task.save

    task = Task.new
    task.title = "Same title"
    task.description = "This task should not be added"
    task.due_date = Date.tomorrow
    task.priority = 3
    task.category_id = @category1.id 
    task.completed = false
    assert_not task.save, "Saved with a duplicate task title"
  end

  test "same task titles should be useable in different categories" do

    task = Task.new
    task.title = "Same title"
    task.description = "This task should added"
    task.due_date = Date.tomorrow
    task.priority = 3
    task.category_id = @category1.id
    task.completed = false
    task.save

    task = Task.new
    task.title = "Same title"
    task.description = "This task should added"
    task.due_date = Date.tomorrow
    task.priority = 3
    task.category_id = @category2.id
    task.completed = false
    assert task.save, "Failed to save task with same title though different category"

  end

  test "should not save new task without priority" do
    task = Task.new
    task.title = "Not saved task"
    task.description = "This task should not be added"
    task.due_date = Date.tomorrow
    task.category_id = @category1.id 
    task.completed = false
    assert_not task.save, "Saved without task priority level"
  end

  test "should not save new task with the value of priority not being an integer between 1-5" do
    task = Task.new
    task.title = "Not saved task"
    task.description = "This task should not be added"
    task.due_date = Date.tomorrow
    task.priority = 6
    task.category_id = @category1.id 
    task.completed = false
    assert_not task.save, "Saved with task priority level not containing a valid value"
  end

  test "should not save new task without category id" do
    task = Task.new
    task.title = "Not saved task"
    task.description = "This task should not be added"
    task.due_date = Date.tomorrow
    task.priority = 5
    task.completed = false
    assert_not task.save, "Saved without category id"
  end

  test "should not save without completed" do
    task = Task.new
    task.title = "Not saved task"
    task.description = "This task should not be added"
    task.due_date = Date.tomorrow
    task.priority = 5
    assert_not task.save, "Saved without completed"
    assert_not_nil(task.completed, "Saved task without completed value")
  end

end
