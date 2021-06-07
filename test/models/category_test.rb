require "test_helper"

class CategoryTest < ActiveSupport::TestCase

  test "should not save new category without title" do
    category = Category.new
    category.description = "This category should not be added"
    category.user_id = 1
    assert_not category.save, "Saved without category title"
  end

  test "title should be unique per user" do
    category = Category.new
    category.title = "Same Title"
    category.description = "This category should be added"
    category.user_id = 1
    category.save

    category = Category.new
    category.title = "Same Title"
    category.description = "This category should not be added"
    category.user_id = 1
    assert_not category.save, "Saved with duplicate title"
  end

  test "same category titles should be useable by different users" do
    category = Category.new
    category.title = "Same Title"
    category.description = "This category should be added"
    category.user_id = 1
    category.save

    category = Category.new
    category.title = "Same Title"
    category.description = "This category should be added"
    category.user_id = 2
    assert category.save, "Failed to save category with similar title but different user"
  end

  test "should not save without user id" do
    category = Category.new
    category.title = "Same Title"
    category.description = "This category should be added"
    assert_not category.save, "Saved without id"
  end

end
