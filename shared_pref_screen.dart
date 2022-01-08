import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';



class SharedPref extends StatelessWidget {
  const SharedPref({Key? key}) : super(key: key);

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shared preferences demo',
      home: MyHomePage(title: 'Сохранение и загрузка данных'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, }) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter1 = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter1();
  }

  //Loading counter1 value on start
  void _loadCounter1() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter1 = (prefs.getInt('counter1') ?? 0);
    });
  }

  //Incrementing counter1 after click
  void _incrementCounter1() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter1 = (prefs.getInt('counter1') ?? 0) + 1;
      prefs.setInt('counter1', _counter1);
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
              'Запись $_counter1 раз в память',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 60, width: 200,
                child: ElevatedButton(onPressed: _incrementCounter1, child: Text ('Записать в память'),
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFF0079D0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(36)
                        )
                    ))),
        FlutterDemo(storage: CounterStorage(),)]
        ),
      ),
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
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<File> _incrementCounter() {
    setState(() {
      _counter++;
    });

    // Write the variable as a string to the file.
    return widget.storage.writeCounter(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text(
          'Запись $_counter раз в файл',
          style: Theme.of(context).textTheme.headline4,
        ),
    SizedBox(height: 60, width: 200,
    child: ElevatedButton(onPressed: _incrementCounter, child: Text ('Записать в файл'),
    style: ElevatedButton.styleFrom(
    primary: Color(0xFF0079D0),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(36)
    )
    )))],
        );
  }
}