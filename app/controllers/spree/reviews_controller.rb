class Spree::ReviewsController < Spree::BaseController
  helper Spree::BaseHelper

  load_and_authorize_resource
  before_filter :load_product, :only => [:index, :new, :create]

  def index
    @approved_reviews = Spree::Review.approved.find_all_by_product_id(@product.id)
  end

  def new
    @review = Spree::Review.new(:product => @product)
  end

  def create
    @review = Spree::Review.new(params[:review])
    @review.product = @product
    @review.user = current_user if user_signed_in?
    @review.location = request.remote_ip

    authorize! :create, @review

    if @review.save
      flash[:notice] = t('review_successfully_submitted')
      respond_to do |format|
        # TODO I may not want to do this in Javascript...
        format.js { render "success" }
      end
    else
      respond_to do |format|
        # TODO I may not want to do this in Javascript...
        format.js { render "error" }
      end
    end
  end

  # TODO Is this needed?
  def terms
  end

  private
    def load_product
      @product = Spree::Product.find_by_permalink!(params[:product_id])
    end
end
