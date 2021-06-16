require 'rails_helper'

feature 'Sign up' do
  background do
    ActionMailer::Base.deliveries.clear
  end

  def extract_confirmation_url(mail)
    body = mail.body.encoded
    body[/http[^"]+/]
  end

  scenario 'ユーザー名,パスワード,メールアドレスでユーザー登録を行う' do
    visit root_path
    expect(page).to have_http_status :ok

    click_link '新規登録'
    fill_in 'user_username', with: 'foo'
    fill_in 'user_email', with: 'foo@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'

    expect { click_button I18n.t('devise.registrations.new.sign_up') }.to change { ActionMailer::Base.deliveries.size }.by(1)
    page.has_text?(I18n.t('devise.registrations.signed_up_but_unconfirmed'))

    user = User.last
    token = user.confirmation_token
    visit user_confirmation_path(confirmation_token: token)
    expect(page).to have_content I18n.t('devise.confirmations.confirmed')

    click_button I18n.t('devise.sessions.new.sign_in')
    expect(page).to have_content I18n.t('devise.failure.not_found_in_database')

    fill_in 'user_email', with: 'hoo@example.com'
    fill_in 'user_password', with: 'password'
    click_button I18n.t('devise.sessions.new.sign_in')
    expect(page).to have_content I18n.t('devise.failure.not_found_in_database')

    fill_in 'user_email', with: 'foo@example.com'
    fill_in 'user_password', with: 'pasword'
    click_button I18n.t('devise.sessions.new.sign_in')
    expect(page).to have_content I18n.t('devise.failure.not_found_in_database')

    fill_in 'user_email', with: 'foo@example.com'
    fill_in 'user_password', with: 'password'
    click_button I18n.t('devise.sessions.new.sign_in')
    expect(page).to have_content I18n.t('devise.sessions.signed_in')
  end
end
