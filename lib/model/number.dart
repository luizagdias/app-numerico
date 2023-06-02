class Number {
  static final Number instance = Number._(0);

  Number._(
    this._number,
  );

  int _number;

  int getNumber() {
    return _number;
  }

  void setNumber(int number) {
    _number = number;
  }
}
