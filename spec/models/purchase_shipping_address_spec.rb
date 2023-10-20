require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_shipping_address = FactoryBot.build(:purchase_shipping_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_shipping_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @purchase_shipping_address.building = nil
        expect(@purchase_shipping_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @purchase_shipping_address.post_code = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_shipping_address.post_code = '1111111'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'post_codeが全角を含んでいると保存できないこと' do
        @purchase_shipping_address.post_code = '１１１-１１１１'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '発送先の地域に「---」が選択されている場合は出品できない' do
        @purchase_shipping_address.shipping_area_id = '1'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @purchase_shipping_address.city = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("City can't be blank")
      end
      it 'streetが空だと保存できないこと' do
        @purchase_shipping_address.street = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Street can't be blank")
      end
      it 'telephoneが10桁未満だと保存できないこと' do
        @purchase_shipping_address.telephone = '111111111'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Telephone of digits is incorrect')
      end
      it 'telephoneが11桁以上だと保存できないこと' do
        @purchase_shipping_address.telephone = '111111111111'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Telephone of digits is incorrect')
      end
      it 'telephoneが全角数字だと保存できないこと' do
        @purchase_shipping_address.telephone = '１１１１１１１１１１１'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Telephone is invalid. Input only number')
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_shipping_address.user_id = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_shipping_address.item_id = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @purchase_shipping_address.token = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
