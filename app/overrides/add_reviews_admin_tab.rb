Deface::Override.new(
  :virtual_path => "spree/admin/shared/_product_sub_menu",
  :name => "add_reviews_admin_tab",
  :insert_bottom => "[data-hook='admin_product_sub_tabs']",
  :text => "<%= tab(:reviews, :label => 'review_management') %>",
  :original => '0dcb488db24f9fcaa4e6baf8b9162d8cbcc8db08',
  :disabled => false
)
