class Good < ActiveRecord::Base

  belongs_to :origin_country, class_name: 'Country'
  belongs_to :design_country, class_name: 'Country'

  validates_presence_of :name,
                        :article,
                        :color,
                        :size,
                        :consist,
                        :count_in_store,
                        :price

end
