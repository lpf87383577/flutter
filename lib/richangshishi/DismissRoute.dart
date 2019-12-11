import 'package:flutter/material.dart';

final List<String> items =
new List<String>.generate(20, (i) => "Item ${i + 1}");

class Dismiss extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          var item = items[index];
          return new Dismissible(
            key: Key(item),
            child: new GestureDetector(
              child: new ListTile(title: new Text('${items[index]}')),

            ),
            onDismissed: (DismissDirection direction) {
              items.removeAt(index);
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('${item}被删除')));
            },
            background: new Container(color: Colors.red),
          );
        });
  }

}
