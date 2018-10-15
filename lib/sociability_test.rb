# class Test : массив вопросов, методы учета баллов и функцию считывания ввода
class Test
  def initialize(user_name)
    @user_name = user_name
  end

  # Задавать пользователю вопросы и записывать его ответы
  def ask_questions(questions)
    score = 0
    questions.each do |question|
      puts question

      user_input = nil

      until user_input == "1" || user_input == "2" || user_input == "3" do
        puts "\nВведите число и нажмите Enter: 1 – да, 2 – нет и 3 – иногда"
        user_input = STDIN.gets.encode("UTF-8").chomp
      end

      if user_input == "1"
        score += 2
      elsif user_input == "3"
        score += 1
      else
        score
      end
    end

    return score
  end

  # Выводим результат пользователю
  def print_status(answers, result)
    if result >= 30
      answers[0]
    elsif result >= 25
      answers[1]
    elsif result >= 19
      answers[2]
    elsif result >= 14
      answers[3]
    elsif result >= 9
      answers[4]
    elsif result >= 4
      answers[5]
    else
      answers[6]
    end
  end
end
