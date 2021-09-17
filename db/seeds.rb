# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

question_list = [
	["ques1", false,1,1 ],
	["ques2", true,1,1 ],
	["ques3", false,1,1 ]
	]



question_list.each do |title, active_question, question_type, level_id|
  Question.create( title: title, active_question: active_question, question_type: question_type, level_id: level_id  )
  
end

option_list = [
  [ 1, "Opt1q1", 1, 1 ],
  [ 1, "Opt2q1", 0, 1 ],
  [ 1, "Opt3q1", 0, 1 ],
  [1, "Opt4q1", 0, 1  ],
  [2, "Opt1q2", 0, 1  ],
  [2, "Opt2q2", 0, 1  ],
  [2, "Opt3q2", 0, 1  ],
  [2, "Opt4q2", 1, 1  ],
  [3, "Opt1q3", 0, 1  ],
  [3, "Opt2q3", 1, 1  ],
  [3, "Opt3q3", 0, 1  ],
  [3, "Opt4q3", 0, 1  ]

]

option_list.each do |question_id, value, correct_option, question_type|
  Option.create( question_id: question_id, value: value, correct_option: correct_option, question_type: question_type )
end