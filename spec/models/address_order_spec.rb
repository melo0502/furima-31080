require 'rails_helper'

RSpec.describe AddressOrder, type: :model do
  before do
    item = FactoryBot.build(:item)
    user = FactoryBot.build(:user)
    @order = FactoryBot.build(:address_order, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '商品購入ができる時' do
      it '全てが入力されてれば購入できる' do
        expect(@order).to be_valid
      end
    end

    context '商品購入ができない時' do
      it "tokenが空では購入できないこと" do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it "郵便番号が空では購入できないこと" do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it "郵便番号がハイフンがないと購入できないこと" do
        @order.postal_code = '2222222'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "郵便番号が半角数字以外では購入できないこと" do
        @order.postal_code = 'aあaあaあa'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が空だと購入できない' do
        @order.ship_form_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Ship form can't be blank")
      end
      it '市区町村が空だと購入できない' do
        @order.municipality = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality can't be blank", "Municipality is invalid. Input full-width characters.")
      end
      it "番地が空では購入できないこと" do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号が空では購入できないこと" do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号が半角数字以外では購入できないこと" do
        @order.phone_number = 'aあaあaあa'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid. Input full-width characters.")
      end
    end
  end
end