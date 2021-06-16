require 'rails_helper'

RSpec.describe User, type: :model do
  it 'name、email、passwordとpassword_confirmationが有効であること' do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it '名前がない場合、無効である' do
    user = FactoryBot.build(:user, username: nil)
    expect(user).not_to be_valid
  end

  it 'メールアドレスがない場合、無効である' do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include('が入力されていません。')
  end

  it 'passwordがない場合、無効である' do
    user = FactoryBot.build(:user, password: nil)
    expect(user).not_to be_valid
  end
end
