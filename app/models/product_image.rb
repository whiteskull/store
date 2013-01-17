class ProductImage < ActiveRecord::Base
  belongs_to :product

  mount_uploader :image, ProductImageUploader
  attr_accessible :image, :image_cache, :remove_image

  validates_presence_of :image
end
