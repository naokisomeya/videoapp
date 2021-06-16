require 'rails_helper'

RSpec.feature 'Microposts', type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let(:micropost) { FactoryBot.create(:micropost) }

  before do
    log_in(user)
  end

  scenario '投稿機能' do
    click_link '投稿'
    click_button '投稿'
    expect(page).to have_content '投稿に失敗しました'

    fill_in 'micropost_name', with: micropost.name
    fill_in 'micropost_youtube_url', with: micropost.youtube_url
    fill_in 'micropost_content', with: micropost.content
    click_button '投稿'
    expect(page).to have_content '投稿に成功しました!!'
  end
end
