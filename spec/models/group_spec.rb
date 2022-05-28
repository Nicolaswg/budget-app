require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do
    @user = User.new(
      name: 'test',
      email: 'test@gmail.com',
      password: '123456'
    )
    @user.save
  end

  subject do
    Group.new(
      name: 'categorie',
      icon: 'test-img',
      author_id: @user.id,
      total_amount: 1
    )
  end

  before { subject.save }

  describe 'Validate Categorie Data' do
    it 'Should have a valid name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'Should have a valid Icon' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end

    it 'Should have a valid total amount' do
      subject.total_amount = 'a'
      expect(subject).to_not be_valid
    end
  end
end
