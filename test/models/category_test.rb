require "test_helper"

class CategoryTest < ActiveSupport::TestCase

  test "should not save new category without title" do
    category = Category.new
    category.description = "This category should not be added"
    assert_not category.save, "Saved without category title"
  end

  test "title should be unique" do
    category = Category.new
    category.title = "Same Title"
    category.description = "This category should be added"
    category.save

    category = Category.new
    category.title = "Same Title"
    category.description = "This category should not be added"
    assert_not category.save, "Saved with duplicate title"
  end
  
end
