require 'rails_helper'

RSpec.feature "Agreement", type: :feature do
  describe "Agreement page" do
		before :each do
			User.destroy_all
			Group.destroy_all
			Agreement.destroy_all
			GroupAgreement.destroy_all

			@user = User.new(
				name: 'test',
				email: 'test@gmail.com',
				password: '123456'
			)		
			@user.save
	
			@categorie = @user.groups.new(
				name: 'Macdonals',
				icon: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzKW-dnXjPIu93BR5ygqA8SeDkUXR8ENZz_w&usqp=CAU',
				total_amount: 0
			)
			@categorie.save

			@agreement = @user.agreements.new(
				name: 'Burguer',
				amount: 100
			)
			@agreement.save

			@ga = GroupAgreement.new(group_id: @categorie.id, agreement_id: @agreement.id)
			@ga.save

			visit new_user_session_path
			fill_in 'Email', with: @user.email
			fill_in 'Password', with: @user.password
			click_button 'Log in'
			click_on('Macdonals')
		end

		it "Should be transaction page" do
			expect(page).to have_content('TRANSACTION')
		end

		it "Should display transaction name" do
			expect(page).to have_content(@agreement.name)
		end

		it "Should display transaction amount" do
			expect(page).to have_content(@agreement.amount)
		end

		it "Should have button to add new transaction" do
			expect(page).to have_link(href: new_group_agreement_path(@categorie.id))
		end

		it "Should redirect to add transaction when clicking in add transaction button" do
			click_link('ADD TRANSACTION')

			expect(page.current_path).to eq(new_group_agreement_path(@categorie.id))
		end
	end
end
