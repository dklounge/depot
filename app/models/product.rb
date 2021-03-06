class Product < ActiveRecord::Base
  default_scope { order 'title' }
  has_many :line_items
  has_many :orders, :through => :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => { :greater_than_or_equal_to => 0.01 }, :presence => true
  validates :title, :uniqueness => true
  validates :image_url, :format => {
    :with => %r{\.(gif|jpg|jpeg|png)}i,
    :message => 'must be a URL for GIF, JPG, JPEG, or PNG image.'
  }

  def ensure_not_referenced_by_any_line_item
    if line_items.count.zero?
      return true
    else
      errors.add(:base, 'Line items present')
      return false
    end
  end
end
