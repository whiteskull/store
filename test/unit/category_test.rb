require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "name length should be minimum 5 char" do
    category_short = Category.new(name: 'four')

    assert category_short.invalid?
    assert_equal ['is too short (minimum is 5 characters)'], category_short.errors[:name]
  end

  test "validates category" do
    category = Category.new

    assert category.invalid?
    assert category.errors[:name].any?
  end

  test "hidden should be false by default" do
    category = Category.new(name: 'new category')
    assert_equal false, category.hidden
  end

  test "name should be unique" do
    hardware_same_name = Category.new(name: categories(:hardware).name)

    assert hardware_same_name.invalid?
    assert_equal ['has already been taken'], hardware_same_name.errors[:name]
  end

  test "should increase when create new product" do
    assert_difference('Product.count') do
      categories(:hardware).products.create(name: 'new product', price: 32.32)
    end
  end

  test "should replace space to dash in alias field after save" do
    category = categories(:hardware)
    category.update_attribute(:name, '   Name with many spaces ')

    assert_equal 'name-with-many-spaces', category.alias
  end
end
