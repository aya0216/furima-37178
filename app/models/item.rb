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
    validates :category_id, numericality: { other_than: 1 , message: "can't be blank" }
    validates :status_id, numericality: { other_than: 1 , message: "can't be blank" }
    validates :postage_id, numericality: { other_than: 1 , message: "can't be blank" }
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" }
    validates :ship_date_id, numericality: { other_than: 1 , message: "can't be blank" }
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_wqual_to: 9_999_999 }
  end

end