class Product < ApplicationRecord

  #association
  belongs_to :category
  belongs_to :sub_category
  has_many :reviews
  has_many :cart_line_items

  #inbuilt validation
  validates_presence_of :name, :price, :category_id, :description, :stock, :sub_category_id
  validates_numericality_of :price, greater_than: 1
  validates_numericality_of :stock, greater_than_or_equal: 0
  validates_numericality_of :category_id, :sub_category_id, greater_than: 0
  validates_length_of :description, minimum: 10
  validates_length_of :name, minimum: 4
  validate :check_for_cod_eligibility_on_price
  validate :check_for_cod_eligibility_based_on_category
  validate :check_for_cod_eligibility

  #custom validation

  def check_for_cod_eligibility_on_price
    if !self.price.nil?
      if self.price > 50000 && self.cod_eligibility
        self.errors.add(:cod_eligibility, "not available for products greater than 50000")
      end
    end
  end

  def check_for_cod_eligibility_based_on_category
    if !self.category_id.nil?
      if self.category_id == 1 && self.cod_eligibility
        self.errors.add(:cod_eligibility, "not available for products belongs to Electronics")
      end
    end
  end

  def check_for_cod_eligibility
    if !self.category_id.nil?
      if self.cod_eligibility && (self.category_id == 1 || self.category_id == 3)
        self.errors.add(:cod_eligibility, "not available for products belongs to Electronics or Equipment")
      end
    end
  end
end
