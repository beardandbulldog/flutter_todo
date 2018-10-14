import 'package:flutter/material.dart';
import 'package:todo/models/item.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Awesome Todo',
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController _textEditingController =
      new TextEditingController();

  List<Item> items = [
    Item('Take a shower'),
    Item('Go shopping'),
    Item('Feed the cat'),
  ];

  _onAddItemPressed() {
    _scaffoldKey.currentState.showBottomSheet<Null>((BuildContext context) {
      return new Container(
        decoration: new BoxDecoration(color: Colors.blueGrey),
        child: new Padding(
          padding: const EdgeInsets.fromLTRB(32.0, 50.0, 32.0, 32.0),
          child: new TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
              hintText: 'Please enter a task',
            ),
            onSubmitted: _onSubmit,
          ),
        ),
      );
    });
  }

  _onSubmit(String s) {
    if (s.isNotEmpty) {
      items.add(Item(s));
      _textEditingController.clear();
      setState(() {});
    }
  }

  _onDeleteItemPressed(item) {
    items.removeAt(item);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text('Awesome Todo'),
      ),
      body: new Container(
        child: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                '${items[index].title}',
              ),
              trailing: new IconButton(
                icon: new Icon(Icons.delete),
                onPressed: () {
                  _onDeleteItemPressed(index);
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _onAddItemPressed,
        tooltip: 'Add task',
        child: new Icon(Icons.add),
      ),
    );
  }
}
