class Spree::Admin::ReviewsController < Spree::Admin::BaseController
  # before_filter :load_data

  def index
    @unapproved_reviews = Spree::Review.not_approved.order("created_at DESC")
    @approved_reviews   = Spree::Review.approved.order("created_at DESC")
  end

  def approve
    r = Spree::Review.find(params[:id])

    if r.update_attribute(:approved, true)
       r.product.recalculate_rating
       flash[:notice] = t("info_approve_review")
    else
       flash[:error] = t("error_approve_review")
    end
    redirect_to spree.admin_reviews_path
  end

  private
    def load_data
      @reviews = Spree::Review.all
    end
end
