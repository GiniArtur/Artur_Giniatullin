import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';


class FilesDemoScreen extends StatelessWidget {
  const FilesDemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Reading and Writing Files',
      home: FlutterDemo(storage: CounterStorage()),
      );
   }
}
class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }
}

class FlutterDemo extends StatefulWidget {
  const FlutterDemo({Key? key, required this.storage}) : super(key: key);

  final CounterStorage storage;

  @override
  _FlutterDemoState createState() => _FlutterDemoState();
}

class _FlutterDemoState extends State<FlutterDemo> {
  int _counterA = 0;
  int _counterB = 0;

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((int value) {
      setState(() {
        _counterA = value;
      });
      setState(() {
        _counterB = value;
      });
    });
  }

  Future<File> _incrementCounterA() {
    setState(() {
      _counterA++;
    });

    // Write the variable as a string to the file.
    return widget.storage.writeCounter(_counterA);
  }
  Future<File> _incrementCounterB() {
    setState(() {
      _counterB++;
    });

    // Write the variable as a string to the file.
    return widget.storage.writeCounter(_counterB);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Чтение и запись в файл"),
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