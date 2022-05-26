require 'rails_helper'

RSpec.feature 'Groups', type: :feature do
  describe 'Groups page' do
    before :each do
      User.delete_all
      Group.delete_all

      @user = User.new(
        name: 'test',
        email: 'test@gmail.com',
        password: '123456'
      )
      @user.save

      @categorie = @user.groups.new(
        name: 'Macdonals',
        icon: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzKW-dnXjPIu93BR5ygqA8SeDkUXR8ENZz_w&usqp=CAU',
        total_amount: 100
      )
      @categorie.save

      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
    end

    it 'Should be categories page' do
      expect(page).to have_content('CATEGORY')
    end

    it 'Should display categories name' do
      expect(page).to have_content(@categorie.name)
    end

    it 'Should display categories total amount' do
      expect(page).to have_content("$#{@categorie.total_amount}")
    end

    it 'Should redirect to transactions page when clicking a category' do
      click_on('Macdonals')
      expect(page.current_path).to eq(group_agreements_path(@categorie.id))
    end

    it 'Should have button to add new categorie' do
      expect(page).to have_link(href: new_group_path)
    end
  end
end
