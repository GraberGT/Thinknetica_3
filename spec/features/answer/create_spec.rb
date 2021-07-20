require 'rails_helper'

feature 'User can create answer', %q{
  As an authenticated user
  being on the question page
  can write the answer to the question
} do

<<<<<<< HEAD
  given(:user)      { create(:user) }
  given!(:question) { create(:question, user: user) }

  scenario 'Authenticated user answer the question' do
=======
  given(:user)       { create(:user) }
  given!(:question)  { create(:question, user: user) }

  scenario 'Authenticated user answer the question', js: true do
>>>>>>> first commit
    sign_in(user)

    visit question_path(question)

    fill_in 'Title', with: 'answer title'
    click_on 'Reply'

    expect(page).to have_content 'Your answers successfully created.'
    expect(page).to have_content 'answer title'
  end

<<<<<<< HEAD
  scenario 'Authenticated user answer the question with error' do
=======
  scenario 'Authenticated user answer the question with error', js: true do
>>>>>>> first commit
    sign_in(user)

    visit question_path(question)

    click_on 'Reply'

    expect(page).to have_content "Title can't be blank"
  end

  scenario 'Not authenticated user answer a question' do
    visit question_path(question)
    click_on 'Reply'

    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
