Deface::Override.new(
  :virtual_path => "spree/admin/configurations/index",
  :name => "add_review_settings_to_configuration_menu",
  :insert_after => "[data-hook='admin_configurations_menu']",
  :partial => "spree/admin/shared/reviews_setting_configurations_menu",
  :original => '92739c67f2db13ae9a5bfce48ce5077764633afc',
  :disabled => false
)
