class Product < ActiveRecord::Base
  searchkick index_name: 'products'

  def search_data
  	{
        name: name,
        description: description,
        company: company,
        count: count,
        color_name: colors.map(&:name),
        size_name: sizes.map(&:name),
        price_amount_usd: price.exchange
    }
  end

  def should_index?
    published # only index published records
  end

  has_and_belongs_to_many :sizes
  has_and_belongs_to_many :colors
  has_one :price
  accepts_nested_attributes_for :sizes
  accepts_nested_attributes_for :colors
  accepts_nested_attributes_for :price

  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
end
