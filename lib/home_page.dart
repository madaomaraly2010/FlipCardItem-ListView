
import 'package:flipcard_listview/card_item.dart';
import 'package:flutter/material.dart';
import 'items.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  List<GlobalKey<CardItemState>> _keys = [];
  GlobalKey _trashkey = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (int i = 0; i < items.length; i++) {
      _keys.add(GlobalKey<CardItemState>());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            padding: EdgeInsets.all(15.0),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    // _keys[index]
                    //     .currentState
                    //     .flip();                    
                  },
                  child: CardItem(key: _keys[index], listItem: items[index],));
            },
          )
        ],
      ),
    
    );
  }
}
