require 'rails_helper'

RSpec.describe User, type: :model do
  subject do 
		User.new(
			name: 'test',
			email: 'test@gmail.com',
			password: '123456'
		)
	end
	
	before {subject.save}

	describe 'Validate User Data' do
	
		it "Should have a valid name" do
			subject.name = nil
			expect(subject).to_not be_valid
		end

		it "Should have a valid email" do
			subject.email = nil
			expect(subject).to_not be_valid
		end

		it "Should have a valid password" do
			expect(subject).to be_valid
		end
	
	end
end
