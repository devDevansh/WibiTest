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
            left: getProportionateScreenWidth(14),
            top: getProportionateScreenWidth(14),
            right: getProportionateScreenWidth(4),
            bottom: getProportionateScreenWidth(14),
          ),
          child: Row(
            children: [
              SizedBox(width: 9),
              Text(
                "Search",
              ),
              SizedBox(width: 21),
              Icon(
                Icons.search_rounded,
                size: 17,
                color: Color(0xFF342E37),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
