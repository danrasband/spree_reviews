Deface::Override.new(
  :virtual_path => "spree/products/show",
  :name => "converted_product_properties",
  :insert_bottom => "div#product_reviews",
  :partial => "spree/shared/reviews",
  # :original => '',
  :disabled => false
)
