import 'package:flutter/material.dart';
import 'custom/custom_expansion_tile_sticky.dart' as sticky;

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sticky Bar"),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return ListView(
      children: [
        sticky.ExpansionTitle(
          title: Text("q"),
          headerBackgroundColor: Colors.orange,
          children: getSecBody(),
        ),
        sticky.ExpansionTitle(
          title: Text("w"),
          headerBackgroundColor: Colors.orange,
          children: getSecBody(),
        ),
        sticky.ExpansionTitle(
          title: Text("e"),
          headerBackgroundColor: Colors.orange,
          children: getSecBody(),
        ),
        sticky.ExpansionTitle(
          title: Text("r"),
          headerBackgroundColor: Colors.orange,
          children: getSecBody(),
        ),
        sticky.ExpansionTitle(
          title: Text("t"),
          headerBackgroundColor: Colors.orange,
          children: getSecBody(),
        ),
        sticky.ExpansionTitle(
          title: Text("y"),
          headerBackgroundColor: Colors.red,
          children: getSecBody(),
        ),
        sticky.ExpansionTitle(
          title: Text("u"),
          headerBackgroundColor: Colors.red,
          children: getSecBody(),
        ),
        sticky.ExpansionTitle(
          title: Text("i"),
          headerBackgroundColor: Colors.red,
          children: getSecBody(),
        ),
        sticky.ExpansionTitle(
          title: Text("o"),
          headerBackgroundColor: Colors.red,
          children: getSecBody(),
        ),
        sticky.ExpansionTitle(
          title: Text("p"),
          headerBackgroundColor: Colors.red,
          children: getSecBody(),
        ),
        sticky.ExpansionTitle(
          title: Text("["),
          headerBackgroundColor: Colors.red,
          children: getSecBody(),
        ),
        sticky.ExpansionTitle(
          title: Text("]"),
          headerBackgroundColor: Colors.red,
          children: getSecBody(),
        ),
      ],
    );
  }
}

getSecBody() {
  return [
    sticky.ExpansionTitle(
      title: Text("a"),
      headerBackgroundColor: Colors.red,
      children: getChirdren(),
    ),
    sticky.ExpansionTitle(
      title: Text("s"),
      headerBackgroundColor: Colors.red,
      children: getChirdren(),
    ),
    sticky.ExpansionTitle(
      title: Text("d"),
      headerBackgroundColor: Colors.red,
      children: getChirdren(),
    ),
    sticky.ExpansionTitle(
      title: Text("f"),
      headerBackgroundColor: Colors.red,
      children: getChirdren(),
    ),
    sticky.ExpansionTitle(
      title: Text("t"),
      headerBackgroundColor: Colors.red,
      children: getChirdren(),
    ),
    sticky.ExpansionTitle(
      title: Text("y"),
      headerBackgroundColor: Colors.red,
      children: getChirdren(),
    ),
    sticky.ExpansionTitle(
      title: Text("u"),
      headerBackgroundColor: Colors.red,
      children: getChirdren(),
    ),
    sticky.ExpansionTitle(
      title: Text("i"),
      headerBackgroundColor: Colors.red,
      children: getChirdren(),
    ),
    sticky.ExpansionTitle(
      title: Text("o"),
      headerBackgroundColor: Colors.red,
      children: getChirdren(),
    ),
    sticky.ExpansionTitle(
      title: Text("p"),
      headerBackgroundColor: Colors.red,
      children: getChirdren(),
    ),
    sticky.ExpansionTitle(
      title: Text("["),
      headerBackgroundColor: Colors.red,
      children: getChirdren(),
    ),
    sticky.ExpansionTitle(
      title: Text("]"),
      headerBackgroundColor: Colors.red,
      children: getChirdren(),
    ),
  ];
}

getChirdren() {
  return [
    Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        height: 100,
        color: Colors.blue,
      ),
    ),
    Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        height: 100,
        color: Colors.blue,
      ),
    ),
    Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        height: 100,
        color: Colors.blue,
      ),
    ),
    Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        height: 100,
        color: Colors.blue,
      ),
    ),
    Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        height: 100,
        color: Colors.blue,
      ),
    ),
    Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        height: 100,
        color: Colors.blue,
      ),
    ),
    Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        height: 100,
        color: Colors.blue,
      ),
    ),
    Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        height: 100,
        color: Colors.blue,
      ),
    ),
    Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        height: 100,
        color: Colors.blue,
      ),
    ),
    Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        height: 100,
        color: Colors.blue,
      ),
    ),
    Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        height: 100,
        color: Colors.blue,
      ),
    ),
    Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        height: 100,
        color: Colors.blue,
      ),
    ),
  ];
}
