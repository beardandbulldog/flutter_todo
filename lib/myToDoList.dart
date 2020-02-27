import 'package:flutter/material.dart';
import 'package:todo/main.dart';

class myToDoList extends InheritedWidget {
  @override
  myToDoList createState() => myToDoListState();
}


class myToDoListState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return items.isEmpty ? Center(child: Text('Empty')) : ListView.builder(
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
        }
    );
  }
}