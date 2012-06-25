class Spree::ReviewsController < Spree::BaseController
  helper Spree::BaseHelper
  # require_role [:user,:admin], :only => [:new,:create]

  def index
    @product = Spree::Product.find_by_permalink params[:product_id]
    @approved_reviews = Spree::Review.approved.find_all_by_product_id(@product.id)
  end

  def new
    @product = Spree::Product.find_by_permalink params[:product_id]
    @review = Spree::Review.new :product => @product
  end

  # save if all ok
  def create
    @product = Spree::Product.find_by_permalink params[:product_id]
    params[:review][:rating].sub!(/\s*stars/,'') unless params[:review][:rating].blank?

    @review = Spree::Review.new :product => @product
    if @review.update_attributes(params[:review])
      flash[:notice] = 'Review was successfully submitted.'
      redirect_to (spree.product_path(@product))
    else
      # flash[:notice] = 'There was a problem in the submitted review'
      render :action => "new"
    end
  end
end
