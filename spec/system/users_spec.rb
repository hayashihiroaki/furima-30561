require 'rails_helper'

RSpec.describe 'トップページ', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規登録ができるとき' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      expect(page).to have_content('ログイン')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'nickname', with: @user.nickname
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      fill_in 'password-confirmation', with: @user.password_confirmation
      fill_in 'first-name', with: @user.first_name
      fill_in 'last-name', with: @user.first_name
      fill_in 'first-name-kana', with: @user.family_name_kana
      fill_in 'last-name-kana', with: @user.first_name_kana
      fill_in 'user_birth_day_1i', with: @user.birth_day
      fill_in 'birth-date', with: @user.birth_day
      fill_in 'birth-date', with: @user.birth_day

      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect  do
        find('input[name="commit"]').click
      end.to change { User.count }.by(1)
      # トップページへ遷移したことを確認する
      expect(current_path).to eq root_path
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
      expect(page).to have_content('@user.nickname')
      expect(page).to have_content('ログアウト')
    end
  end
end
