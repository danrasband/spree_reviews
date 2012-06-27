Deface::Override.new(
  :virtual_path => "spree/products/show",
  :name => "reviews_global_rating",
  :insert_bottom => "[data-hook=product_right_part]",
  :partial => "spree/shared/rating",
  :original => 'cb09475eb14012ed435ee2774c09a52cd7e9a7ba',
  :disabled => false
)
