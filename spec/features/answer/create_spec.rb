require 'rails_helper'

feature 'User can create answer', %q{
  As an authenticated user
  being on the question page
  can write the answer to the question
} do

  given!(:user)       { create(:user) }
  given!(:question)  { create(:question, user: user) }

  describe 'Authenticated user', js: true do
    before { sign_in(user) }
    before { visit question_path(question) }

    scenario 'answer the question' do
      fill_in 'Title', with: 'answer title'
      click_on 'Reply'

      expect(page).to have_content 'Your answers successfully created.'
      expect(page).to have_content 'answer title'
    end

    scenario 'answer the question with attach files' do
      fill_in 'Body', with: 'answer body'

      attach_files
      click_on 'Reply'

      expect(page).to have_link 'rails_helper.rb'
      expect(page).to have_link 'spec_helper.rb'
    end

    scenario 'answer the question with error' do
      click_on 'Reply'

      expect(page).to have_content "Title can't be blank"
    end

  scenario 'Not authenticated user answer a question' do
    visit question_path(question)
    click_on 'Reply'

    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
