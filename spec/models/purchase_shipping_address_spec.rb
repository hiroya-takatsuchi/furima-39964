require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item, user: user)
      @purchase = FactoryBot.build(:purchase, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @purchase_shipping_address.building = nil
        expect(@purchase_shipping_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @purchase.post_code = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase.post_code = '1111111'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postcode can't be blank")
      end
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @purchase.shipping_area_id = '1'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Shipping area can't be blank")
      it 'priceが空だと保存できないこと' do
      end
      it 'priceが全角数字だと保存できないこと' do
      end
      it 'priceが1円未満では保存できないこと' do
      end
      it 'priceが1,000,000円を超過すると保存できないこと' do
      end
      it 'userが紐付いていないと保存できないこと' do
      end
    end
  end
end
