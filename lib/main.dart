import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todo/models/item.dart';
import 'package:todo/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Awesome Todo',
      home: HomePage(),
      theme: ThemeData(
        bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Colors.black.withOpacity(0)),
      )
    );
  }
}

class Todo {
  Todo({this.title, this.isDone = false});
  String title;
  bool isDone;
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();
  List<Item> items = [
    Item('Take a shower'),
    Item('Go shopping'),
    Item('Feed the cat'),
  ];


  mySubmit(String s) {
  if (_formKey.currentState.validate()) {
    items.add(Item(s));
    _textEditingController.clear();
      setState(() {});
    }
  }

  onAddItemPressed() {
    _scaffoldKey.currentState.showBottomSheet<Null>((BuildContext context) {

            return Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
              child: Form(
              key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0,),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x4DA16A62),
                              blurRadius: 30.0,
                              spreadRadius: 0.0,
                              offset: Offset(
                                0.0,
                                20.0,
                              ),
                            )
                          ]
                      ),
                      child: TextFormField(
                          controller: _textEditingController,
                          autofocus: true,
                          decoration: new InputDecoration(
                            hintText: 'What do you want to achieve today?',
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(50.0)),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(50.0)),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(50.0)),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(50.0)),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical:10.0, horizontal:20,),
                          ),
                          onFieldSubmitted: mySubmit,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter a task you want to get done today';
                            }
                            return null;
                          }
                          ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlatButton(

                                onPressed: Navigator
                                    .of(context)
                                    .pop,
                                child: Text('Cancel')
                            ),
                            FlatButton(
                                child: Text('Add item'),
                                onPressed: () {
                                  print("I'm in pressed!");
                                }
                            ),

                          ]

                      ),

                    ),
                  ]


              ),
            ),

        );

    }
    );
  }

  @override
  Widget build(BuildContext context,) {
   return new Scaffold(
      key: _scaffoldKey,
     backgroundColor: Color(0xFFFBF1EF),
      appBar: AppBar(
        title: Text(
            'Wednesday',
          style: Theme.of(context).textTheme.headline3,)
      ),
      body: Container(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                '${items[index].title}',
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  print('Yay?');
                  /*
                  _onDeleteItemPressed(index);*/
                },
              ),
            );
          },
        ),



      ),
     floatingActionButton: FloatingActionButton(
       onPressed: () {
         onAddItemPressed();
       },
       child: Icon(Icons.add,),
       mini: true,
     ),

    );
  }
}

