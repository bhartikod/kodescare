# frozen_string_literal: true

module UserAnswersHelper

	def question_marks(question)
	if question.SCQ?
                 1
               elsif @question.MCQ?
                 2
               elsif @question.TEXT?
                 3
               elsif @question.CODE?
                 5
               end
    end
end
