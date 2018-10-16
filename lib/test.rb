# class Test : массив вопросов, методы учета баллов и функцию считывания ввода
class Test
  ANSWER_YES = "1"
  ANSWER_NO = "2"
  ANSWER_SOMETIMES = "3"

  def initialize(user_name, questions_file_path, answers_file_path)
    @user_name = user_name

    @questions = File.readlines(questions_file_path)
    @answers = File.readlines(answers_file_path)

    @score = 0
  end

  # Задавать пользователю вопросы и записывать его ответы
  def ask_questions
    @questions.each do |question|
      puts question

      user_input = nil

      until user_input == ANSWER_YES || user_input == ANSWER_NO || user_input == ANSWER_SOMETIMES do
        puts "\nВведите число и нажмите Enter: 1 – да, 2 – нет и 3 – иногда"
        user_input = STDIN.gets.encode("UTF-8").chomp
      end

      xxx(user_input)
    end
  end

  def xxx(user_input)
    if user_input == ANSWER_YES
      @score += 2
    elsif user_input == ANSWER_SOMETIMES
      @score += 1
    else
      @score
    end
  end

  # Выводим результат пользователю
  def print_answer
    case @score
    when 30..32 then
      @answers[0]
    when 24..29 then
      @answers[1]
    when 19..24 then
      @answers[2]
    when 14..18 then
      @answers[3]
    when 9..13 then
      @answers[4]
    when 4..8 then
      @answers[5]
    when 0..3 then
      @answers[6]
    end
  end
end
