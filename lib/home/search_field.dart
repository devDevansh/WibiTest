import 'package:WIBI/components/size_config.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F0),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        onChanged: (value) => print(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            left: getProportionateScreenWidth(18),
            top: getProportionateScreenWidth(14),
            right: getProportionateScreenWidth(4),
            bottom: getProportionateScreenWidth(14),
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: "Search",
          prefixIcon: Icon(
            Icons.search_rounded,
            color: Color(0xFF263238),
          ),
        ),
      ),
    );
  }
}
