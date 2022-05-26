require 'rails_helper'

RSpec.feature "Splashes", type: :feature do
  describe 'Splash screen' do
		before :each do
			visit unauthenticated_root_path
		end

		it "Should be splash page" do
			expect(page.current_path).to eq('/')
		end
		
		it "Should show splash title" do
				expect(page).to have_content('Budget app')
		end 

		it "Should have Log in button" do
			expect(page).to have_link(href: new_user_session_path)
		end

		it "Should have Sign up button" do
			expect(page).to have_link(href: new_user_registration_path)
		end

		it "Should redirect to log in page" do
			click_link('Log in')
			expect(page.current_path).to eq(new_user_session_path)
		end
	end
end
