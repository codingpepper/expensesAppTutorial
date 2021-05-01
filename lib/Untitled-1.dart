import 'package:flutter/material.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App name',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> myStrings = ['one', 'two', 'three'];

  final _saved = <String>[];

  void _pushSaved() {
    print('Button pressed');

    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('saved one')),
        body: Text('I am the boy'),
      );
    }));
  }

  Widget _myList() {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return _myRowCell(myStrings[index]); 
      },
      itemCount: myStrings.length,
    );
  }

  Widget _myRowCell(String theString) {
    final alreadySaved = _saved.contains(theString);

    return ListTile(
      title: Text(theString),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(theString);
            print(_saved);
          } else {
            _saved.add(theString);
          }
        });
      },
      trailing: Icon(
        alreadySaved ? Icons.favorite_outline : Icons.favorite,
        color: alreadySaved ? Colors.red : Colors.blue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hellow'),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _pushSaved,
          ),
        ],
      ),
      body: _myList(),
    );
  }
}
