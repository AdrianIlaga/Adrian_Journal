require "test_helper"

class TaskTest < ActiveSupport::TestCase

  test "should not save new task without title" do
    task = Task.new
    task.description = "This task should not be added"
    task.due_date = Date.tomorrow
    task.priority = 5
    task.category_id = 2
    task.completed = false
    assert_not task.save, "Saved without task title"
  end

  test "task title should be unique" do
    task = Task.new
    task.title = "Same title"
    task.description = "This task should added"
    task.due_date = Date.tomorrow
    task.priority = 3
    task.category_id = 2
    task.completed = false
    task.save

    task = Task.new
    task.title = "Same title"
    task.description = "This task should not be added"
    task.due_date = Date.tomorrow
    task.priority = 3
    task.category_id = 2
    task.completed = false
    assert_not task.save, "Saved with a duplicate task title"

  end

  test "should not save new task without priority" do
    task = Task.new
    task.title = "Not saved task"
    task.description = "This task should not be added"
    task.due_date = Date.tomorrow
    task.category_id = 2
    task.completed = false
    assert_not task.save, "Saved without task priority level"
  end

  test "should not save new task with the value of priority not being an integer between 1-5" do
    task = Task.new
    task.title = "Not saved task"
    task.description = "This task should not be added"
    task.due_date = Date.tomorrow
    task.priority = 6
    task.category_id = 2
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
