class Spree::Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  attr_accessible :rating, :review, :name

  validates_presence_of :name, :review
  validates_numericality_of :rating, :if => Proc.new {|r| !r.rating.blank?}

  default_scope order("created_at DESC")

  scope :approved, lambda {|*args| {:conditions => ["(? = ?) or (approved = ?)", SpreeReviews::Config[:include_unapproved_reviews], true, true ]}}
  scope :not_approved, where("approved = ?", false)

  scope :approval_filter, lambda {|*args| {:conditions => ["(? = 't') OR (approved = ?)", SpreeReviews::Config[:include_unapproved_reviews], true]}}

  scope :oldest_first, :order => "created_at asc"
  scope :preview,      :limit => SpreeReviews::Config[:preview_size], :order=>"created_at desc"

  def approved?
    !!self.approved
  end
end
