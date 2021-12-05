class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :ship_date


  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :postage_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :ship_date_id, numericality: { other_than: 1 }
  end

  with_options presence: true do
    validates :image
    validates :title
    validates :info
    validates :price
  end

end