require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
  before do
    # @user = FactoryBot.create(:user)
    # visit new_session_path
    # fill_in 'session_email', with:'test1@example.com'
    # fill_in 'session_password', with:'123456'
    # click_on 'ログイン'
    # FactoryBot.create(:task, user: @user)
    FactoryBot.create(:payment)
    FactoryBot.create(:category)
    # visit tasks_path
  end

  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される', js: true do        
        visit events_path
        page.first(".fc-day").click
        # sleep 0.5
        # visit new_event_path
        # fill_in "event_date", with: '002021-05-30'
        # fill_in "event_amount", with: 'タスク詳細'
        # fill_in "event_note", with: ''
        # select "現金", from: 'event_payment_id'
        # select "食費", from: 'event_category_id'
        # find("#event_payment_id").find("option[value='1']").select_option
        # find("#event_category_id").find("option[value='1']").select_option
        # find(".form-control")[1].set("1000")
        # click_on "入力完了"
        # expect(page).to have_content "食費"
    
        select "現金", from: "event[payment_id]"
        select '食費', from: "event[category_id]"
        
        fill_in "event_amount", with: 1000        
        click_on "入力完了"
        expect(page).to have_content "食費 : 1,000円"
      end
    end
  end
end