class Product < ActiveRecord::Base
  belongs_to :category, counter_cache: true
  has_many :product_images, dependent: :destroy

  accepts_nested_attributes_for :product_images, allow_destroy: true
  attr_accessible :product_images_attributes, allow_destroy: true

  attr_accessible :description, :name, :price, :category_id

  validates :name, :price, :category, presence: true

  validates_uniqueness_of :name

  before_save :replace_spaces

  private

  def replace_spaces
    self.alias = name.downcase.strip.gsub(' ', '-')
  end
end
