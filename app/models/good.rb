class Good < ActiveRecord::Base

  self.per_page = 16

  # == REFERENCES
  belongs_to :origin_country, class_name: 'Country'
  belongs_to :design_country, class_name: 'Country'
  belongs_to :brand
  belongs_to :category

  has_many :goods_sizes
  has_many :sizes, through: :goods_sizes
  has_many :images, class_name: 'GoodPicture'

  accepts_nested_attributes_for :images, allow_destroy: true

  # == VALIDATORS
  validates :title, :count_in_stock, :price, presence: true

  # === SCOPES
  scope :by_category, ->(id){where(category_id: id)}

  scope :winter, ->{where(season: 'winter')}
  scope :summer, ->{where(season: 'summer')}
  scope :by_season, ->(season){where(season: season)}
  scope :main_offers, ->{where(main_offer: true)}

  def main_image
    GoodPicture.where(main_image: true, good_id: self.id).first
  end

end
