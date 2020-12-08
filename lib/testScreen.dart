import 'package:flutter/material.dart';
import 'package:retailer/test.dart';

class TestMainScreen extends StatelessWidget {
  final List data = ["SST", "AHM", "NT"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Double Expansion"),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: (){
              showSearch(
                              context: context,
                              delegate: DropDownSearch(
                              ));
                        }),
        
        ],
      ),
      // body: getMainExpansion(),
    );
  }

  Widget getMainExpansion() {
    return ListView.builder(
      itemBuilder: (context, index) => ExpansionTile(
        backgroundColor: Colors.blue,
        title: Text(data[index]),
        children: [
          getSubTile(),
        ],
      ),
      itemCount: data.length,
    );
  }

  Widget getSubTile() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => ExpansionTile(
        backgroundColor: Colors.green,
        title: Text("this is sub title"),
        children: [
          getChildren(),
        ],
      ),
      itemCount: data.length,
    );
  }

  Widget getChildren() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          tileColor: Colors.white,
          title: Text("I am soe san tun"),
        ),
      ),
      itemCount: data.length,
    );
  }
}
