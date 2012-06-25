class Spree::Review < ActiveRecord::Base
  belongs_to :product

  validates_presence_of :name, :location, :title, :review
  validates_numericality_of :rating, :only_integer => true

  scope :approved,     lambda {|*args| {:conditions => "approved = 't'"}}
  scope :not_approved, lambda {|*args| {:conditions => "approved = 'f'"}}

  scope :approval_filter, lambda {|*args| {:conditions => ["(? = 't') OR (approved = 't')", SpreeReviews::Config[:include_unapproved_reviews]]}}

  scope :oldest_first, :order => "created_at asc"
  scope :preview,      :limit => SpreeReviews::Config[:preview_size], :order=>"created_at desc"

end
