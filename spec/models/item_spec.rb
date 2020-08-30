require 'rails_helper'
RSpec.describe Item,type: :model do
   before do
     @item=FactoryBot.build(:item)
     @item.image = fixture_file_upload('IMG_4621.jpeg')
   end
 


   describe 'itemの出品' do
      context 'itemが出品できる場合' do
       it "入力項目が全て揃っていれば出品できる" do
            expect(@item.image).to be_valid
            
         end
         

         it "価格が300から999999の間であれば出品できる" do
             @item.price="10000"
             expect(@item.image).to be_valid
         end
         it "価格が半角数字であれば出品できる"do
             @item.price="1234"
             expect(@item.image).to be_valid
         end
      end  
     
      context 'itemが出品きない場合' do
         it "画像が一枚でもないと保存できない"do
            @item.image= nil
            @item.valid?
            expect(@item.errors.full_messages).to include("Image can't be blank")
         end
         it "商品名が空だと保存できない"do
            @item.name=""
            @item.valid?
            expect(@item.errors.full_messages).to include("Name can't be blank")
         end
         it "商品の説明がないと保存できない" do
            @item.text=""
            @item.valid?
            expect(@item.errors.full_messages).to include("Text can't be blank")
         end
         it"カテゴリーが選択されていないと保存できない" do
            @item.category_id="1"
            @item.valid?
            expect(@item.errors.full_messages).to include("Category must be other than 1")
         end
         it"商品の状態が空だと保存できない"do
            @item.sales_status_id="1"
            @item.valid?
            expect(@item.errors.full_messages).to include("Sales status must be other than 1")
         end
         it"配送料の負担についての情報がないと保存できない" do
            @item.shipping_fee_status_id="1"
            @item.valid?
            expect(@item.errors.full_messages).to include("Shipping fee status must be other than 1")
         end
         it"発送元の地域についての情報がないと保存できない" do
            @item.prefecture_id=""
            @item.valid?
            expect(@item.errors.full_messages).to include("Prefecture can't be blank")
         end
         it"価格についての情報が空だと保存できない" do
            @item.price=""
            @item.valid?
            expect(@item.errors.full_messages).to include("Price can't be blank")
         end
       
         it"価格が¥300以上でないと保存できない" do
            @item.price="11"
            @item.valid?
            expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
         end

         it"価格が9999999以下でないと保存ができない" do
            @item.price="1111111111"
            @item.valid?
            expect(@item.errors.full_messages).to include("Price must be less than or equal to 999999")
         end
         it"販売価格は半角数字のみ" do
           @item.price="１２３４"
           @item.valid?
           expect(@item.errors.full_messages).to include("Price is not a number")
         end
      end
   end
end




#  ログインしているユーザーだけが、出品ページへ遷移できること

 