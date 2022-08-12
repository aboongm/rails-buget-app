require 'rails_helper'

RSpec.describe 'category index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Ran', email: 'ran10@gmail.com', password: '123456')
    @category = Category.create(name: 'test', icon: 'https://cdn-icons-png.flaticon.com/512/891/891462.png',
                                user_id: @user.id)
    @expense = Expense.create(name: 'expense', amount: 10, user_id: @user.id, category_id: @category.id)

    visit root_path
    visit new_user_session_path
    fill_in 'Email', with: 'ran10@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log In'
    visit category_path(@category.id)
  end

  describe 'tests for view categories#show' do
    it 'spec for show page ' do
      expect(page).to have_content 'Transactions'
      expect(page).to have_content 'test'

      expect(page).to have_content 'Expense'
      expect(page).to have_content 'Add Expense'
    end

    it 'see the total amount of expenses' do
      expect(page).to have_content '$10'
    end
  end
end
