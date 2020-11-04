require 'rails_helper'
describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが@マークを含んでないと登録出来ない' do
      @user.email = 'aaa111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid", "Email is invalid")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下であれば登録できない' do
      @user.password = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordは半角英数混合じゃないと登録出来ない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'name_seiが空だと登録出来ない' do
      @user.name_sei = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Name sei is invalid')
    end
    it 'name_seiが半角英数だと登録出来ない' do
      @user.name_sei = '1a2a3a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Name sei is invalid')
    end
    it 'name_nameが空だと登録出来ない' do
      @user.name_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name name can't be blank")
    end
    it 'name_nameが半角英数だと登録出来ない' do
      @user.name_name = '1a2a3a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Name name is invalid')
    end
    it 'name_sei_kanaが空だと登録出来ない' do
      @user.name_sei_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name sei kana can't be blank")
    end
    it 'name_sei_kanaが半角英数だと登録出来ない' do
      @user.name_sei_kana = '1a2a3a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Name sei kana is invalid')
    end
    it 'name_sei_kanaが漢字だと登録出来ない' do
      @user.name_sei_kana = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include('Name sei kana is invalid')
    end
    it 'name_sei_kanaがひらがなだと登録出来ない' do
      @user.name_sei_kana = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Name sei kana is invalid')
    end
    it 'name_name_kanaが空だと登録出来ない' do
      @user.name_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name name kana can't be blank")
    end
    it 'name_nameが半角英数だと登録出来ない' do
      @user.name_name_kana = '1a2a3a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Name name kana is invalid')
    end
    it 'name_name_kanaが漢字だと登録出来ない' do
      @user.name_sei_kana = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include('Name sei kana is invalid')
    end
    it 'name_name_kanaがひらがなだと登録出来ない' do
      @user.name_sei_kana = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include('Name sei kana is invalid')
    end
    it 'birthdayが空だと登録出来ない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
