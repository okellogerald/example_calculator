import 'homepage.dart';

class Service {
  var _expression = '';
  var _result = '0.0';

  String get getExpression => _expression;
  String get getResult => _result;

  var _index = 0;

  final _operators = <Operators>[];
  final _values = <String>[''];

  void addValue(String value) {
    _values[_index] += value;
    _expression = _expression + value;
  }

  void addOperator(Operators operator) {
    switch (operator) {
      case Operators.add:
        _expression = _expression + ' + ';
        _addOperator(operator);
        break;
      case Operators.minus:
        _expression = _expression + ' - ';
        _addOperator(operator);
        break;
      case Operators.multiply:
        _expression = _expression + ' * ';
        _addOperator(operator);
        break;
      case Operators.divide:
        _expression = _expression + ' / ';
        _addOperator(operator);
        break;
      case Operators.equal:
        _calculateResult();
        break;
      case Operators.percent:
        break;
      case Operators.negate:
        break;
    }
  }

  _addOperator(Operators operator) {
    _operators.add(operator);
    _index++;
    _values.add('');
  }

  _calculateResult() {
    var result = 0.0;
    print(_values);
    for (var operator in _operators) {
      final firstValue = double.parse(_values[0]);
      final secondValue = double.parse(_values[1]);
      result = _getResult(firstValue, operator, secondValue);
      _values.removeAt(0);
      _values[0] = result.toString();
    }
    _result = result.toString();
  }

  double _getResult(double firstValue, Operators operator, double secondValue) {
    switch (operator) {
      case Operators.add:
        return firstValue + secondValue;
      case Operators.minus:
        return firstValue - secondValue;
      case Operators.divide:
        return firstValue / secondValue;
      case Operators.multiply:
        return firstValue * secondValue;
      default:
        return 0.0;
    }
  }
}
