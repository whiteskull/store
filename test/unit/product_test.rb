require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "validates product" do
    product = Product.new

    assert product.invalid?
    assert product.errors[:name].any?
    assert product.errors[:price].any?
    assert product.errors[:category].any?
  end

  test "name should be unique" do
    product_same_name = Product.new(name: products(:windows).name)

    assert product_same_name.invalid?
    assert_equal ['has already been taken'], product_same_name.errors[:name]
  end

  test "should replace space to dash in alias field after save" do
    product = products(:windows)
    product.update_attribute(:name, '   Name with many spaces ')

    assert_equal 'name-with-many-spaces', product.alias
  end
end
