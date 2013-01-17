class Category < ActiveRecord::Base
  has_many :products, dependent: :destroy
  attr_accessible :hidden, :name

  validates :name, presence: true, length: {minimum: 5}, uniqueness: true

  scope :get_all, -> { where(hidden: false) }

  def self.get_by_name(category_name)
    where(alias: category_name).first
  end

  def self.get_product(category_name, product_name)
    category = get_by_name(category_name)
    category.products.where(alias: product_name).first
  end

  before_save :replace_spaces

  private

  def replace_spaces
    self.alias = name.downcase.strip.gsub(' ', '-')
  end
end
