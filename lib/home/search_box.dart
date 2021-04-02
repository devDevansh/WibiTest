import 'package:WIBI/components/size_config.dart';
import 'package:WIBI/search/search.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F0),
        borderRadius: BorderRadius.circular(25),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => SearchField(),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(6),
            top: getProportionateScreenWidth(7),
            right: getProportionateScreenWidth(64),
            bottom: getProportionateScreenWidth(5),
          ),
          child: Icon(
            Icons.search_rounded,
            size: 35,
            /* color: Color(0xFF342E37), */
            color: Color(0xFF546E7A),
          ),
        ),
      ),
    );
  }
}
