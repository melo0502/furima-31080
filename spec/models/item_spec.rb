require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品ができる時' do
      it '全てが入力されてれば出品できる' do
        expect(@item).to be_valid
      end
    end
    
    context '商品出品ができない時' do
      it '画像が空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it '商品の説明が空だと出来ない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーが空だと出来ない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end
      it 'カテゴリーが1だと出来ない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it '商品の状態が空だと出来ない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", "Status is not a number")
      end
      it '商品の状態が1だと出来ない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it '配送料の負担が空だと出来ない' do
        @item.delivery_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank", "Delivery fee is not a number")
      end
      it '配送料の負担が1だと出来ない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end
      it '発送元の地域が空だと出来ない' do
        @item.ship_form_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship form can't be blank", "Ship form is not a number")
      end
      it '発送元の地域が1だと出来ない' do
        @item.ship_form_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship form must be other than 1")
      end
      it '発送までの日数が空だと出来ない' do
        @item.delivery_days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days can't be blank", "Delivery days is not a number")
      end
      it '発送までの日数が1だと出来ない' do
        @item.delivery_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days must be other than 1")
      end
      it '販売価格が空だと出来ない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が299円以下だと出来ない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '販売価格が10000000円以上だと出来ない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
    end
  end
end