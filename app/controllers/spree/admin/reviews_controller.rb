class Spree::Admin::ReviewsController < Spree::Admin::BaseController
  before_filter :load_review, :only => [:edit, :update, :approve]

  def index
    @unapproved_reviews = Spree::Review.not_approved.order("created_at DESC")
    @approved_reviews   = Spree::Review.approved.order("created_at DESC")
  end

  def create
    respond_to do |format|
      format.html { redirect_to spree.admin_reviews_path }
    end
  end

  def update
    respond_to do |format|
      format.html { redirect_to spree.admin_reviews_path }
    end
  end

  def approve
    @review.approved = true
    if @review.product.rating.nil?
      @review.product.rating = Spree::Rating.create :value => 0, :count => 0
    end
    @review.product.rating.add_rating(@review.rating)

    if @review.save
       flash[:notice] = t("info_approve_review")
    else
       flash[:error] = t("error_approve_review")
    end
    redirect_to spree.admin_reviews_path
  end

  private
    def load_review
      @review = Spree::Review.find(params[:id])
    end

end
