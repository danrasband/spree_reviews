Deface::Override.new(
  :virtual_path => "spree/admin/shared/_configuration_menu",
  :name => 'add_review_settings_link_configuration_menu',
  :insert_bottom => "[data-hook='admin_configurations_sidebar_menu']",
  :text => %q{<%= configurations_sidebar_menu_item t("reviews_rating.review_settings"), admin_review_settings_path %>},
  :original => 'e2d1c7b6471195385b6648f21946590e1916ac3f',
  :disabled => false
)
