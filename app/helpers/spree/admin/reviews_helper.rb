module Spree::Admin::ReviewsHelper
  def txt_stars(n, show_out_of = true)
    return t('no_rated') unless n
    res = I18n.t('star', :count => n)
    res += ' ' + t('out_of_5') if show_out_of
    res
  end
end
