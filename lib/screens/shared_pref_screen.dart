import 'package:auth_page/screens/networking_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MyApp());

class MyAppShared extends StatelessWidget {
  const MyAppShared({Key? key}) : super(key: key);

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shared preferences demo',
      home: MyHomePage(title: 'Изменение счетчика'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counterA = 0;
  int _counterB = 0;


 @override
  void initState() {
    super.initState();
    _loadCounterA();
    _loadCounterB();
  }

  //Loading counter value on start
  void _loadCounterA() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counterA = (prefs.getInt('counterA') ?? 0);
    });
  }
    void _loadCounterB() async {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        _counterB = (prefs.getInt('counterB') ?? 0);
      });

  }

  //Incrementing counter after click
    void _incrementCounterA() async {
      final prefs = await SharedPreferences.getInstance();

      setState(() {
        _counterA = (prefs.getInt('counterA') ?? 0) + 1;
        prefs.setInt('counterA', _counterA);
      });
    }
  void _incrementCounterB() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _counterB = (prefs.getInt('counterB') ?? 0) + 1;
      prefs.setInt('counterB', _counterB);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Вы нажали на первую кнопку ',
                style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              '$_counterA раз',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 30,),
            Text(
              'Вы нажали на вторую кнопку ',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
        '$_counterB раз',
         style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 70,),
            SizedBox (width: 154, height: 42, child: ElevatedButton(
              onPressed: _incrementCounterA,
              child: Text ('Первая кнопка'),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF0079D0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36.0)
                ),
              ),
            )),
            SizedBox(height: 15,),
            SizedBox (width: 154, height: 42, child: ElevatedButton(
              onPressed: _incrementCounterB,
              child: Text ('Вторая кнопка'),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF0079D0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36.0)
                ),
              ),
            )),
          ],

        ),
      ),
     //floatingActionButton: FloatingActionButton(
       //  onPressed: _incrementCounter,
      //tooltip: 'Increment',
      //child: const Icon(Icons.add),
      //);
                        // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}