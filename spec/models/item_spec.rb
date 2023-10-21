require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品の保存' do
    context '商品が投稿できる場合' do
      it 'すべてのカラムが存在すれば投稿できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が投稿できない場合' do
      it 'nameが空では投稿できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'explainationが空では登録できない' do
        @item.explaination = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explaination can't be blank"
      end
      it 'category_idが空では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category_id can't be blank"
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition_id can't be blank"
      end     
      it 'del_fee_idが空では登録できない' do
        @item.del_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Del_fee_id can't be blank"
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture_id can't be blank"
      end
      it 'days_until_shipping_idが空では登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Days_until_shipping_id can't be blank"
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
end