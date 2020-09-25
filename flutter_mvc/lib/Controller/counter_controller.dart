import 'package:flutter_mvc/Model/counter_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class CounterController extends ControllerMVC
{
  static CounterController _this;
  factory CounterController()
  {
    if(_this == null)_this=CounterController._();
    return _this;
  }

  int get counter => CounterModel.counter;
  CounterController._();
  void incrementCounter()
  {
    CounterModel.incrementCounter();
  }
   void decrementCounter()
   {
     CounterModel.decrementCounter();
   }

}