module LoginMacros
  def log_in(user)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button I18n.t('.devise.sessions.new.sign_in')
  end

  def logout
    click_link 'ログアウト'
    expect(page).to have_content 'ログアウトしました。'
  end
end
