require 'rails_helper'

RSpec.describe Answer, type: :model do
  it { should belong_to :question }
  it { should belong_to :user }
  it { should have_many(:links).dependent(:destroy) }
  it { should have_db_index :question_id }
  it { should have_db_index :user_id }
  it { should accept_nested_attributes_for :links }
  it { should validate_presence_of :title }
  it_behaves_like 'commentable'
  it_behaves_like 'likable'
  it 'have many attached files' do
    expect(Answer.new.files).to be_an_instance_of(ActiveStorage::Attached::Many)
  end

  describe '#best!' do
    let(:user)          { create(:user) }
    let(:question)      { create(:question, user: user) }
    let!(:best_answer)  { create(:answer, question: question, user: user, best: true) }
    let(:answer)        { create(:answer, question: question, user: user) }

    before { answer.best! }
    before { best_answer.reload }

    it 'should make answer the best' do
      expect(answer).to be_best
    end

    it 'should change the best answer' do
      best_answer.best!
      answer.reload

      expect(answer).to_not be_best
      expect(best_answer).to be_best
    end

    it 'only one answer can be the best' do
      expect(question.answers.best.count).to eq 1
    end

    it 'best answer is first in list' do
      best_answer.best!
      expect(best_answer).to eq question.answers.first
    end
  end
end
