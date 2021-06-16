require 'rails_helper'

RSpec.describe Micropost, type: :model do
  let(:micropost) { build(:micropost)}

  describe 'validation' do
    describe 'presence' do
      it 'タイトルがない場合無効である' do
        micropost.name = ''
        expect(micropost).not_to be_valid
      end

      it '詳細がない場合無効である' do
        micropost.content = ''
        expect(micropost).not_to be_valid
      end

      it 'URLがない場合無効である' do
        micropost.youtube_url = ''
        expect(micropost).not_to be_valid
      end
    end
  end
end

