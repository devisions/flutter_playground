import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  //

  int _counter;

  Counter(this._counter);

  getValue() => _counter;

  setCounter(int counter) => _counter = counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }

  //
}
