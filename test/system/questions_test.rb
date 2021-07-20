require 'application_system_test_case'

QUESTION_WORK = 'I am going to work'
ANSWER_WORK = 'Great!'
ANSWER_QUESTION = 'Silly question, get dressed and go to work!'
ANSWER_ELSE = "I don't care, get dressed and go to work!"

class QuestionsTest < ApplicationSystemTestCase
  test 'visiting /ask renders the form' do
    visit ask_url
    assert_selector 'p', text: 'Ask your coach anything'
  end

  test 'saying `Hello` yields a grumpy response from the coach' do
    visit ask_url
    fill_in 'question', with: 'Hello'
    click_on 'Ask'

    assert_text ANSWER_ELSE
    take_screenshot
  end

  test 'asking something or nothing yields a dismissive response from the coach' do
    visit ask_url
    fill_in 'question', with: '?'
    click_on 'Ask'

    assert_text ANSWER_QUESTION
    take_screenshot
  end

  test 'saying `I am going to work` yields `Great!` as an answer from the coach' do
    visit ask_url
    fill_in 'question', with: QUESTION_WORK
    click_on 'Ask'

    assert_text ANSWER_WORK
    take_screenshot
  end
end