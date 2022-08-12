require 'rails_helper'

RSpec.describe Expense, type: :model do
  before(:all) do
    @user = User.create(name: 'Ran', email: 'example11@test.com', password: '123456')
    expect(@user).to be_valid
    @category = Category.create(name: 'Fast-food', icon: 'fast-food.png', user_id: @user.id)
    expect(@category).to be_valid
    @expense = Expense.new(name: 'expense on fast food', amount: 100, category_id: @category.id, user_id: @user.id)
  end

  describe 'Validations' do
    it 'should be valid' do
      expect(@expense).to be_valid
      expect(@expense.name).to eq('expense on fast food')
      expect(@expense.amount).to eq(100)
    end
  end
end
