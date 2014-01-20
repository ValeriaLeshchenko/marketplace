class Product < ActiveRecord::Base
  has_and_belongs_to_many :tags
  searchkick index_name: 'products'

  def search_data
  	{
        name: name,
        description: description,
        company: company,
        count: count,
        published: published,
        color_name: colors.map(&:name),
        size_name: sizes.map(&:name),
        tag_name: tags.map(&:name),
        tag_id: tags.map(&:id),
        price_amount_usd: price.exchange
    }
  end

  def should_index?
    published && price# only index published records
  end


  belongs_to :seller
  has_and_belongs_to_many :sizes
  has_and_belongs_to_many :colors
  has_one :price
  accepts_nested_attributes_for :sizes
  accepts_nested_attributes_for :colors
  accepts_nested_attributes_for :price

  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  def tag_list=value
    self.tags = value.split(",").map do |n|
      Tag.where(name: n.strip.capitalize!).first_or_create!
    end
  end

  def tag_list
    self.tags.join(',')
  end

  def tag_name_list
    self.tags.pluck(:name)
  end
end
