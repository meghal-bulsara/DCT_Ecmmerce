class SubCategory < ApplicationRecord
  validates_presence_of :name, :category_id
  validates_uniqueness_of :name
  validates_numericality_of :category_id, greater_than: 0

  belongs_to :category
  has_many :products
end
