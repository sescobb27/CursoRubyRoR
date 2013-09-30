class Product < ActiveRecord::Base
  attr_accessible :name, :bar_code, :price
  validates_presence_of :name, :bar_code, :price
  validates_uniqueness_of :bar_code
  validates_length_of :name, within: 7..15
  validates_numericality_of :price, greater_than_or_equal_to: 5
end
