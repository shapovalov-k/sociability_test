# encoding: utf-8

# Подключаем класс test.
require "./lib/test.rb"

# Этот код необходим только при использовании русских букв на Windows.
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

current_path = File.dirname(__FILE__) + '/data'
questions_file_path = current_path + "/questions.txt"
answers_file_path = current_path + "/answers.txt"

user_name = ARGV[0]

# Если пользователь забыл указать аргумент, записываем сюда - Любознательный человек.
if user_name == nil
  user_name = "Любознательный человек"
end

puts "\nДобро пожаловать #{user_name}! Давайте оценим ваш уровень общительности."
puts "\nИнструкция : Вашему вниманию предлагается несколько простых вопросов"
puts "\nОтвечайте быстро, однозначно: 1 - «да», 2 - «нет», 3 - «иногда». \n\n"

# Создаем объект test класса Test
test = Test.new(user_name, questions_file_path, answers_file_path)

# Задаем пользователю вопрос и просим на него ответить
test.ask_questions

# Выводим игроку результаты теста
puts "\nВаш результат теста : "
puts test.print_answer
