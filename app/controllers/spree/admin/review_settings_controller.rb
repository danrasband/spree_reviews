class Spree::Admin::ReviewSettingsController < Spree::Admin::BaseController
  def show
    @preferences = ['preview_size']
  end

  def edit
    @preferences = [:include_unapproved_reviews, :show_email,
      :require_login, :form_show, :preview_size, :star_big]
  end

  def update
    params.each do |name, value|
      next unless Spree::Config.has_preference? name
      Spree::Config[name] = value
    end

    redirect_to spree.admin_review_settings_path
  end
end
