require 'rails_helper'

RSpec.feature 'Comment', type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let(:micropost) { FactoryBot.create(:micropost) }

  before do
    log_in(user)
    create(:micropost)
  end

  scenario 'コメント機能' do
    visit microposts_path
    click_link '詳細'
    click_button '送信'
    expect(page).to have_content 'コメントに失敗しました'

    fill_in 'comment[comment_content]', with: 'aaaaaaaaaaaa'
    click_button '送信'
    expect(page).to have_content 'コメントに成功しました'
  end
end
