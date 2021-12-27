# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

question_list = [
  ['ques1 for beginner scq', true, 1, 1],
  ['ques2 for beginner mcq', true, 2, 1],
  ['ques3 for competent scq', false, 1, 2],
  ['ques4 for competent mcq', false, 2, 2],
  ['ques5 for competent text', false, 3, 2],
  ['ques6 for proficient scq', false, 1, 3],
  ['ques7 for proficient mcq', false, 2, 3],
  ['ques8 for proficient text', false, 3, 3],
  ['ques9 for expert scq', false, 1, 4],
  ['ques10 for expert mcq', true, 2, 4]
]
question_list.each do |title, active_question, question_type, level_id|
  Question.create(title: title, active_question: active_question, question_type: question_type, level_id: level_id)
end

option_list = [
  [1, 'Opt1 q1 scq', 1, 1],
  [1, 'Opt2 q1 scq', 0, 1],
  [1, 'Opt3 q1 scq', 0, 1],
  [1, 'Opt4 q1 scq', 0, 1],
  [2, 'Opt1 q2 mcq', 0, 2],
  [2, 'Opt2 q2 mcq', 0, 2],
  [2, 'Opt3 q2 mcq', 1, 2],
  [2, 'Opt4 q2 mcq', 1, 2],
  [3, 'Opt1 q3 scq', 0, 1],
  [3, 'Opt2 q3 scq', 1, 1],
  [3, 'Opt3 q3 scq', 0, 1],
  [3, 'Opt4 q3 scq', 0, 1],
  [4, 'Opt1 q4 mcq', 0, 2],
  [4, 'Opt2 q4 mcq', 1, 2],
  [4, 'Opt3 q4 mcq', 0, 2],
  [4, 'Opt4 q4 mcq', 1, 2],
  [6, 'Opt1 q6 scq', 0, 1],
  [6, 'Opt2 q6 scq', 1, 1],
  [6, 'Opt3 q6 scq', 0, 1],
  [6, 'Opt4 q6 scq', 0, 1],
  [7, 'Opt1 q7 mcq', 0, 2],
  [7, 'Opt2 q7 mcq', 1, 2],
  [7, 'Opt3 q7 mcq', 0, 2],
  [7, 'Opt4 q7 mcq', 1, 2],
  [9, 'Opt1 q9 scq', 0, 1],
  [9, 'Opt2 q9 scq', 1, 1],
  [9, 'Opt3 q9 scq', 0, 1],
  [9, 'Opt4 q9 scq', 0, 1],
  [10, 'Opt1 q10 mcq', 0, 2],
  [10, 'Opt2 q10 mcq', 1, 2],
  [10, 'Opt3 q10 mcq', 1, 2],
  [10, 'Opt4 q10 mcq', 0, 2]
]

option_list.each do |question_id, value, correct_option, question_type|
  Option.create(question_id: question_id, value: value, correct_option: correct_option, question_type: question_type)
end
