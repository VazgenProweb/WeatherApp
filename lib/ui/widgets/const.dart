class Const {
  Const._();
  static const String error404 =
      'https://cdn.dribbble.com/users/1033824/screenshots/5905597/404-dribbble.gif';
 
}

void borderPrint(
  text, {
  // Количество символов рамки
  int count = 90,
  // Текст до сообщения
  String title = 'Вывод',
  // Символ рамки
  String s = '=',
}) {
  // Генерация рамки
  var border = List.generate(count, (index) => 1).join('').replaceAll(r'1', s);
  // Вывод сообщения в консоль
  print('$border\n$title: $text\n$border');
}

String capitalize(String str) => str[0].toUpperCase() + str.substring(1);