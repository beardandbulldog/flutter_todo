import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todo/models/item.dart';
import 'package:todo/theme.dart';
import 'package:todo/utils.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Awesome Todo',
      home: HomePage(),
      theme:todayTheme(),

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
  List<Item> items = [];


  mySubmit(String s) {
    if (_formKey.currentState.validate()) {
      items.add(Item(s));
      _textEditingController.clear();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context,) {
    return new Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(0xFFFBF1EF),
        //appBar: AppBar(title: Text('Wednesday')),
        body: SafeArea(
            child: Stack(
                alignment: Alignment(1.0, 1.0),
                children:<Widget>[



            CustomScrollView(
             slivers: <Widget>[
              ///First sliver is the App Bar
              SliverAppBar(
              ///Properties of app bar
                backgroundColor: Colors.white,
                floating: false,
                pinned: true,
                expandedHeight: 200.0,///Properties of the App Bar when it is expanded
                  flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                    title: Text(
                    "SliverList Widget",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        ),
                    ),
                    background: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.black26,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  ),
            ),
            SliverList(
            ///Use SliverChildListDelegate and provide a list
            ///of widgets if the count is limited
            ///
            ///Lazy building of list
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                /// To convert this infinite list to a list with "n" no of items,
                /// uncomment the following line:
                 if (items.isNotEmpty) return null;
                return Container(
                  child: Text("It's Empty"),
                );
              },
              /// Set childCount to limit no.of items
              childCount: 1
            ),
          )
          ],
        ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 8.0),
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
                                  decoration: new InputDecoration(
                                    hintText: 'What are you going to achieve today?',
                                    hintStyle: Theme.of(context).textTheme.bodyText2,
                                    filled: true,
                                    fillColor: Colors.white,
                                    suffixIcon: IconButton(
                                        icon: Icon(Icons.add_circle),
                                        iconSize: 30.0,
                                        color: Colors.red,
                                        onPressed: () {
                                          print('tada');
                                        }),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                      borderSide: BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                      borderSide: BorderSide(color: Colors.white,),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                        borderSide: BorderSide(color: Colors.white)
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                      borderSide: BorderSide(color: Colors.white),
                                    ),
                                    contentPadding: EdgeInsets.only(top:10.0, bottom: 10.0, left:20, right: 5,),
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
                          ]


                      ),
                    ),

                  ),


                ]
            )
        )
    );

  }
}

Widget listItem(Color color, String title) => Container(
  height: 100.0,
  color: color,
  child: Center(
    child: Text(
      "$title",
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.white,
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
    ),
  ),
  ),
);
