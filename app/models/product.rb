class Product < ActiveRecord::Base
  has_and_belongs_to_many :sizes
  has_and_belongs_to_many :colors
  has_one :price
  accepts_nested_attributes_for :sizes
  accepts_nested_attributes_for :colors
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
end
