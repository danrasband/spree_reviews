Spree::Product.class_eval do
  has_one :rating
  has_many :reviews

  def get_stars
    if rating.nil?
      [0,0]
    else
      [rating.get_stars, rating.count]
    end
  end
end
