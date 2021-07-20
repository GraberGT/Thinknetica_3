require 'rails_helper'

feature 'User can delete answer' do
  given(:author)    { create(:user) }
  given(:user)      { create(:user) }
  given!(:question) { create(:question, user: user) }
  given!(:answer)   { create(:answer, question: question, user: author) }

<<<<<<< HEAD
  scenario 'Author delete answer' do
=======
  scenario 'Author delete answer', js: true do
>>>>>>> first commit
    sign_in(author)

    visit question_path(question)

<<<<<<< HEAD
    click_on 'Remove answer'

    expect(page).to have_content 'Answer successfully deleted.'
    expect(page).to_not have_content answer.title
=======
    within '.answers' do
      click_on 'Remove answer'

      expect(page).to_not have_content answer.body
    end

    expect(page).to have_content 'Answer successfully deleted.'
>>>>>>> first commit
  end

  scenario 'Non author delete answer' do
    sign_in(user)

    visit question_path(question)

    expect(page).to_not have_content 'Remove answer'
  end

  scenario 'Not authenticated user delete answer' do
    visit question_path(question)

    expect(page).to_not have_content 'Delete answer'
  end
end
