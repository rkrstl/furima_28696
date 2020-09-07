require 'rails_helper'
describe UserOrder,type: :model do
    before do
      @order = FactoryBot.build(:user_order)
    end

      describe '商品の購入' do
        context '商品が購入できる場合' do
          it "address2以外全て揃っていれば購入できる" do
            expect(@order).to be_valid
          end

          it "郵便番号が正しい形であれば購入できる" do
            @order.postal_code="123-4567"
            expect(@order).to be_valid
          end
       end

        context '商品が購入できない場合' do
          it "都道府県が選択されていないと購入できない"do
            @order.prefecture_id=""
            @order.valid?
            expect(@order.errors.full_messages).to include("Prefecture can't be blank")
          end

          it "郵便番号が空だと購入できない" do
            @order.postal_code=""
            @order.valid?
            expect(@order.errors.full_messages).to include("Postal code can't be blank")

          end

          it "郵便番号にはハイフンが必要であること" do
            @order.postal_code="1234567"
            @order.valid?
            expect(@order.errors.full_messages).to include("Postal code is invalid")
          end

          it "cityが空だと購入できない" do
            @order.city=""
            @order.valid?
            expect(@order.errors.full_messages).to include("City can't be blank")
          end

          it "address1が空だと購入できない" do
            @order.address1=""
            @order.valid?
            expect(@order.errors.full_messages).to include("Address1 can't be blank")
          end

          it "telephoneが空だと購入できない" do
            @order.telephone=""
            @order.valid?
            expect(@order.errors.full_messages).to include("Telephone can't be blank")
          end

          it "電話番号にハイフンは不要" do
            @order.telephone="080-1111-1111"
            @order.valid?
            expect(@order.errors.full_messages).to include("Telephone is invalid")
          end
        end
      end
   end