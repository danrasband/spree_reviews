Spree::Product.class_eval do
  has_many :reviews

  def get_stars
    {:star => ((2.0 * self.avg_rating.to_f).round / 2.0), :rcount => reviews_count}
  end

  def recalculate_rating
    count = reviews_count(true)
    self.avg_rating = (reviews_count > 0) ? (self.reviews.approved.sum(:rating).to_f / count) : 0
    self.update_attributes(:avg_rating => avg_rating.to_f, :reviews_count => count)
  end

  private
    def reviews_count(reset = false)
      if @reviews_count && !reset
        return @reviews_count
      else
        @reviews_count = reviews.reload.approved.where('rating IS NOT NULL').count
      end
    end
end
