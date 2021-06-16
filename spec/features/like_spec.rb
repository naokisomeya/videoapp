require 'rails_helper'

RSpec.feature 'Likes', type: :feature do
  let(:user) { FactoryBot.create(:user) }
  before do
    create(:micropost)
    log_in(user)
  end

  scenario 'like_button', js: true do
    visit microposts_path
    click_link '詳細'
    find('.far').click
    expect(page).to have_css '.fas'
  end
end
