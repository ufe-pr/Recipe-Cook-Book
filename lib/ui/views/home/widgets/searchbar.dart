import 'package:flutter/material.dart';

import '../../../../constants/themes/light_color.dart';

class SearchBar extends StatelessWidget {
  final void Function(String) func;

  const SearchBar({Key key, this.func}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: LightColor.lightGrey.withAlpha(100),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search for your Recipe",
                hintStyle: TextStyle(fontSize: 12),
                contentPadding:
                    EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 5),
                prefixIcon: Icon(Icons.search, color: Colors.black54),
              ),
              onSubmitted: func,
            ),
          ),
        ),
      ],
    );
  }
}
