require 'rails_helper'

RSpec.describe 'タスクモデル機能', type: :model do
  let!(:payment) { FactoryBot.create(:payment) }
  let!(:category) { FactoryBot.create(:category) }
  describe 'バリデーションのテスト' do
    context 'タスクのタイトルが空の場合' do
      it 'バリデーションにひっかる' do
        event = Event.new(date: '', amount: 'タイトル失敗テスト', note: '002021/02/10')
        expect(event).not_to be_valid
      end
    end

    context 'タスクの詳細が空の場合' do
      it 'バリデーションにひっかかる' do
        event = Event.new(date: '002021/05/10', amount: '', note: '002021/02/10')
        expect(event).not_to be_valid
      end
    end

    context 'タスクのタイトルと詳細に内容が記載されている場合' do
      it 'バリデーションが通る' do
        # payment = create(:payment)
        # category = create(:category)
        event = FactoryBot.build(:event,
                                  title: "",
                                  date: '002021/05/10',
                                  amount: '1000',
                                  note: '',
                                  payment_id: payment.id,
                                  category_id: category.id)
        expect(event).to be_valid
      end
    end
  end
end