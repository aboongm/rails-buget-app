require 'rails_helper'

RSpec.describe 'category index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Ran', email: 'ran10@gmail.com', password: '123456')
    @category = Category.create(name: 'test', icon: 'https://cdn-icons-png.flaticon.com/512/891/891462.png',
                                user_id: @user.id)
    @expense = Expense.create(name: 'expense', amount: 10, user_id: @user.id, category_id: @category.id)

    visit root_path
    click_link 'LOG IN'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log In'
  end

  scenario 'user can see the category index page' do
    expect(page).to have_content('Add a category')
  end

  it 'see a name of category' do
    expect(page).to have_content 'test'
  end

  it 'see the total amount' do
    expect(page).to have_content '$10'
  end
end
