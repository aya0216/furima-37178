require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入内容確認' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @order_address = FactoryBot.build(:order_address, item_id: item.id, user_id: user.id)
    end

    context '商品購入ができる場合' do
      it '全ての値が正しく入力されていれば購入できる' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも購入できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '商品購入ができない場合' do
      it 'postcodeが空では購入できない' do
        @order_address.postcode = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode can't be blank")

      end
      it 'postcodeが半角ハイフンを含んだ正しい形式でないと購入できない' do
        @order_address.postcode = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode is invalid")
      end
      it 'prefectureが未選択では購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空では購入できない' do
        @order_address.block = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'phoneが空では購入できない' do
        @order_address.phone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが10桁以下では購入できない' do
        @order_address.phone = '090123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
      end
      it 'phoneがハイフンを省かなければ購入できない' do
        @order_address.phone = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
      end
      it 'phoneが半角数値でなければ購入できない' do
        @order_address.phone = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
      end
      it 'itemが紐付いていないと購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'userが紐付いていないと購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
