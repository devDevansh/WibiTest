import 'package:flutter/material.dart';

import './size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.52,
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F0),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        onChanged: (value) => print(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(18),
              vertical: getProportionateScreenWidth(14)),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: "Search",
          prefixIcon: Icon(
            Icons.search_rounded,
            color: Color(0xFF2A2D36),
          ),
        ),
      ),
    );
  }
}
