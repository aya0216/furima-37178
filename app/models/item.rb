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
    validates :image
    validates :title
    validates :info
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_wqual_to: 9_999_999 }
  end
  with_options numericality: { other_than: 1 , message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :postage_id
    validates :prefecture_id
    validates :ship_date_id
  end
end