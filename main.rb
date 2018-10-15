# encoding: utf-8

# Подключаем класс sociability_test
require "./lib/sociability_test"

# Этот код необходим только при использовании русских букв на Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

questions_file_name = File.dirname(__FILE__) + "/data/questions.txt"
answers_file_name = File.dirname(__FILE__) + "/data/answers.txt"

questions_file = File.new(questions_file_name, 'r:utf-8')
questions = questions_file.readlines
questions_file.close

answers_file = File.new(answers_file_name, 'r:utf-8')
answers = answers_file.readlines
answers_file.close

user_name = ARGV[0]

# Если пользователь забыл указать аргумент, записываем сюда - Любознательный человек
if user_name == nil
  user_name = "Любознательный человек"
end

puts "\nДобро пожаловать #{user_name}! А теперь давайте оценим ваш уровень общительности."
puts "\nИнструкция : Вашему вниманию предлагается несколько простых вопросов. Отвечайте быстро, однозначно: 1 - «да», 2 - «нет», 3 - «иногда»."

# Создаем объект test класса Test с параметром user_name
test = Test.new(user_name)

# Задаем пользователю вопрос и просим на него ответить
result = test.ask_questions(questions)
# Выводим игроку результаты теста
puts "\nВаш результат теста : "
puts test.print_status(answers, result)
