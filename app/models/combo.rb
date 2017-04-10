class Combo < ApplicationRecord
  has_many :combo_dishes
  has_many :dishes, through: :combo_dishes, dependent: :destroy

  validates :name, presence: true
  validates :discount, presence: true, numericality: true
  def total
    dishes.sum(&:price)
  end
end
