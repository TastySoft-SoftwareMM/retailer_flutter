import 'package:flutter/material.dart';

class DropDownSearch extends SearchDelegate {
  final List<String> aa = ["data", "aa", "bb", "cc"];
  String _selected;

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return Container();
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      child: DropdownButtonFormField(
        
        value: _selected,
        onChanged: (newValue) {
          _selected = newValue;
        },
        items: getDropdownChirdren(),
      ),
    );
  }

  List<DropdownMenuItem<String>> getDropdownChirdren() {
    return aa.map((element) {
      return DropdownMenuItem<String>(
        child: Text(element),
        value: element,
      );
    }).toList();
  }
}
