class Flower < ActiveRecord::Base
  mount_uploader :image, FlowerImageUploader

  has_many :orders, through: :orders_flowers

  before_create :setRemaining

  def setRemaining
    self.remaining = self.stock
  end
end