class Good < ActiveRecord::Base

  self.per_page = 18

  # == REFERENCES
  belongs_to :origin_country, class_name: 'Country'
  belongs_to :design_country, class_name: 'Country'
  belongs_to :brand
  belongs_to :category

  has_many :goods_sizes
  has_many :sizes, through: :goods_sizes
  has_many :images, class_name: 'GoodPicture'

  has_one :main_image, -> { where main_image: true }, class_name: 'GoodPicture'

  accepts_nested_attributes_for :images, allow_destroy: true

  # == VALIDATORS
  validates :title, :count_in_stock, :price, presence: true
  validates_presence_of :goods_sizes

  # === SCOPES
  scope :winter,      -> { where(season: 'winter') }
  scope :summer,      -> { where(season: 'summer') }
  scope :main_offers, -> { where(main_offer: true) }
  scope :on_sale,     -> { where(on_sale: true) }
  scope :gifts,       -> { where(is_gift: true) }

  # == CALLBACKS
  after_save :check_main_image, if: -> (good) { good.images.any? }

  def has_discount?
    !!(monetary_discount && monetary_discount > 0)
  end

  def cost
    price - (monetary_discount || 0)
  end

  private

  def check_main_image
    unless main_image
      images.first.update_column(:main_image, true)
    end
  end
end
