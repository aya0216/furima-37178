class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :ship_date

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :postage_id
    validates :prefecture_id
    validates :ship_date_id
  end
end