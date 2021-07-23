class QuestionsController < ApplicationController
  def ask; end

  def answer
    @question = params[:question]
    @answer = if @question.blank?
                "I can't hear you!"
              elsif @question =~ /i am going to work/i
                'Great!'
              elsif @question.ends_with?('?')
                'Silly question, get dressed and go to work!'
              else
                "I don't care, get dressed and go to work!"
              end
  end
end
