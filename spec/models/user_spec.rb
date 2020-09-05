require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nameとemail、passwordとpassword_confirmationが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nameが空では登録できないこと' do
      @user.nick_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが6文字以上であれば登録できること' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      expect(@user).to be_valid
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'first_nameが空では登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("first_name can't be blank")
    end

    it 'family_nameが空では登録できないこと' do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("family_name can't be blank")
    end

    it 'first_kanaが空では登録できないこと' do
      @user.first_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("first_kana can't be blank")
    end

    it 'family_kanaが空では登録できないこと' do
      @user.family_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("family_kana can't be blank")
    end

    it 'dateが空では登録できないこと' do
      @user.date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("date can't be blank")
    end

    it 'パスワードは半角英数字混合であること' do
      @user.password = hoge1234
      user.valid?
      expect(@user.errors[:password]).to include('は半角英数字を含む必要があります')
    end

    it 'メールアドレスは@を含む必要があること' do
      @user.mail = hoge @xxx
      user.valid?
      expect(@user.errors[:email]).to include('は@を含む必要があります')
    end
  end
end
