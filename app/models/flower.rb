class Flower < ActiveRecord::Base
  mount_uploader :image, FlowerImageUploader

  has_many :orders, through: :orders_flowers

  before_create :setRemaining

  validates :name, :description, :price, :image, :stock, presence: true
  validates :name, uniqueness: true
  validates :stock, :remaining, numericality: {only_integer: true, greater_than: 0}
  validates :price, numericality: {greater_than: 0}

  def setRemaining
    self.remaining = self.stock
  end
end