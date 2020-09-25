import 'package:flutter/material.dart';
import 'package:flutter_mvc/Controller/counter_controller.dart';


class MyHomeView extends StatefulWidget {
  final String title = 'MVC Demo';
  final String title1 = 'Push Buttons to increase and decrease value.';
  @override
  _MyHomeViewState createState() => _MyHomeViewState();
}

class _MyHomeViewState extends State<MyHomeView> {

  final CounterController _con = CounterController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Text(
                widget.title1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () {
                    setState(_con.decrementCounter);
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
                Text(
                  _con != null ? '${_con.counter}' : "hi",
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(_con.incrementCounter);
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ],
            ),
            Row(
              children: <Widget>[

              ],
            ),
          ],
        ),
      ),
    );;
  }
}
