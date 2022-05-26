require 'rails_helper'

RSpec.describe Agreement, type: :model do
  before :each do
		@user = User.new(
			name: 'test',
			email: 'test@gmail.com',
			password: '123456'
		)
		@user.save
	end

	subject do
		Agreement.new(
			name: 'transaction',
			amount: 1,
			author_id: @user.id,
		)
	end
	
	before {subject.save}

	describe 'Validate Transaction Data' do
		
		it "Should have a valid name" do
			subject.name = nil
			expect(subject).to_not be_valid
		end

		it "Should have a valid amount" do
			subject.amount = 'a'
			expect(subject).to_not be_valid
		end
	end

end
