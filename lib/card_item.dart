import 'package:flipcard_listview/flip_card.dart';
import 'package:flipcard_listview/list_item.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardItem extends StatefulWidget {
  final ListItem listItem;

  CardItem({Key key, this.listItem}) : super(key: key);

  @override
  CardItemState createState() => CardItemState();
}

class CardItemState extends State<CardItem> with TickerProviderStateMixin {
  AnimationController animationController;

  double _width;

  double _height;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700))
          ..addStatusListener((status) {});
    super.initState();
  }

  flip() {
    animationController.reset();
    animationController.forward();
  }

  stop() {
    animationController.reset();
  }

  _buildCard() {
    return FlipCard(
        front: _buildFront(),
        back: _buildBack(),
        direction: FlipDirection.HORIZONTAL,
        speed: 3000);
  }

  _buildFront() {
    return Container(
      height: 240,
      margin: EdgeInsets.only(bottom: 10.0),
      child: Card(
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage(widget.listItem.imagePath),
                      radius: 30,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text(
                            widget.listItem.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 23.0),
                          ),
                          Text(
                            widget.listItem.jobTitle,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.listItem.description,style: TextStyle(
                      fontSize: 16.0
                  ),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildBack() {
    return Container(
      height: 240,
      child: Card(
        elevation: 14,
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(20.0)),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.listItem.imagePath),
                    radius: 30,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Social Links",
                    style: TextStyle(fontSize: 23.0, color: Colors.white),
                  )
                ],
              ),
            ),
              SizedBox(height: 10.0,),
            Row(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.twitter,
                  color: Colors.red,
                ),
                SizedBox(width: 10.0,),
                Text(
                  "/twitter",
                  style: TextStyle(color: Colors.red,fontSize: 20.0),
                )
              ],
            ),
            SizedBox(height: 10.0,),
           Row(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.facebook,
                  color: Colors.red,
                ),
                SizedBox(width: 10.0,),
                Text(
                  "/facebook",
                  style: TextStyle(color: Colors.red,fontSize: 20.0),
                )
              ],
            ),
            SizedBox(height: 10.0,),
            Row(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.linkedin,
                  color: Colors.red,
                ),
                SizedBox(width: 10.0,),
                Text(
                  "/linkedIn",
                  style: TextStyle(color: Colors.red,fontSize: 20.0),
                )
              ],
            ),
            SizedBox(height: 10.0,),
            Row(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.instagram,
                  color: Colors.red,
                ),
                SizedBox(width: 10.0,),
                Text(
                  "/instagram",
                  style: TextStyle(color: Colors.red,fontSize: 20.0),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildAnimatedCardShake();
  }

  _buildAnimatedCardShake() {
    return AnimatedBuilder(
      animation: animationController,
      child: _buildCard(),
      builder: (context, child) {
        double v = math.sin(animationController.value * math.pi * 10.0) * 10;
        return Transform.translate(
          offset: Offset(v, 0),
          child: child,
        );
      },
    );
  }
}
