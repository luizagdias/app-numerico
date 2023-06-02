import 'package:app_numerico/model/number.dart';

class NumberController {
  static final NumberController instance = NumberController();

  int calculateNumber(String operator, int value) {
    int number = Number.instance.getNumber();
    if (operator == '+') {
      number = number + value;
    } else if (operator == '-') {
      number = number - value;
    } else {
      number = number * value;
    }
    Number.instance.setNumber(number);
    return number;
  }
}
