require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :questions }
  it { should have_many :badges }

  it { should validate_presence_of :email }
  it { should validate_presence_of :password }

  describe '#author?' do
    let(:user)     { create(:user) }
    let(:any_user) { create(:user) }

    it 'current user is author' do
      question = create(:question, user: user)

      expect(user).to be_author(question)
    end

    it 'current user not an author' do
      question = create(:question, user: any_user)

      expect(user).to_not be_author(question)
    end
  end

  describe '#award_badge!' do
    let(:user)     { create(:user) }
    let(:question) { create(:question, user: user) }
    let(:badge)    { create(:badge, question: question) }

    it 'user awarding the badge' do
      user.award_badge!(badge)

      expect(badge).to eq user.badges.last
    end
  end
end
