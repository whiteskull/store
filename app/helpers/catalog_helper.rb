module CatalogHelper
  def product_lightbox(product)
    link_to image_tag(product.product_images.first.image.thumb.url),
            product.product_images.first.image.url,
            rel: 'lightbox[product]',
            title: product.name
  end
end
