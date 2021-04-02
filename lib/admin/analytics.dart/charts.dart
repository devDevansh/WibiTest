import 'dart:convert';

import 'package:WIBI/admin/admin_screen.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:http/http.dart';

class AnalyticsPage extends StatefulWidget {
  final Widget child;

  AnalyticsPage({Key key, this.child}) : super(key: key);

  _AnalyticsPageState createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  List<charts.Series<CountProductsByDate, String>> _seriesData;
  List<charts.Series<ProductByCat, String>> _seriesPieData;
  //List<charts.Series<Sales, int>> _seriesLineData;
  Map<String, int> m = new Map<String, int>();
  Map<String, int> m2 = new Map<String, int>();
  String s = "Total users";
  int totalUsers;

  Future<Map> getProductCountByDate() async {
    Response response = await get('http://10.0.2.2:8080/countprodbydate');
    var decode = jsonDecode(response.body);
    return decode;
  }

  Future<Map> countprodbycat() async {
    Response response = await get('http://10.0.2.2:8080/countprodbycat');
    var decode = jsonDecode(response.body);
    return decode;
  }

  Future<int> noOfUsers() async {
    Response response = await get('http://10.0.2.2:8080/countusers');
    var decode = jsonDecode(response.body);
    print(decode);
    return decode;
  }

  _generateData() {
    noOfUsers().then((value) {
      totalUsers = value;
    });
    // ignore: deprecated_member_use
    List<CountProductsByDate> data2 = new List<CountProductsByDate>();
    getProductCountByDate().then((value) {
      print("Printing the map here ");
      print(value);
      print(value.length);
      value.forEach((k, v) {
        print('$k: $v');
        String key = k.toString();
        int values = int.parse(v.toString());

        print(key);
        print(values);
        m[key] = values;
        if (data2.length < 4) {
          data2.add(new CountProductsByDate(key, values, false));
        }
        if (data2.length == 3)
          data2.add(new CountProductsByDate("Total Users", totalUsers, true));
      });
    });

    // ignore: deprecated_member_use
    List<ProductByCat> piedata = new List<ProductByCat>();
    int colorPicker = 0;
    List<Color> colorVals = [
      Color(0xff233C75),
      Color(0xff1D5391),
      Color(0xff0077BC),
      Color(0xff1DA3B8),
      Color(0xff50BFA1),
      Color(0xff67DBBC),
      Color(0xff8CD9C4),
    ];
    countprodbycat().then((value) {
      print("Printing the map here ");
      print(value);
      print(value.length);
      value.forEach((k, v) {
        print('$k: $v');
        String key = k.toString();
        int values = int.parse(v.toString());

        print(key);
        print(values);
        m2[key] = values;
        piedata.add(new ProductByCat(key, values, colorVals[colorPicker]));
        colorPicker++;
      });
    });

    /*    var linesalesdata = [
      new Sales(0, 45),
      new Sales(1, 56),
      new Sales(2, 55),
      new Sales(3, 60),
      new Sales(4, 61),
      new Sales(5, 70),
    ];
    var linesalesdata1 = [
      new Sales(0, 35),
      new Sales(1, 46),
      new Sales(2, 45),
      new Sales(3, 50),
      new Sales(4, 51),
      new Sales(5, 60),
    ];

    var linesalesdata2 = [
      new Sales(0, 20),
      new Sales(1, 24),
      new Sales(2, 25),
      new Sales(3, 40),
      new Sales(4, 45),
      new Sales(5, 60),
    ]; */

    // this is for the Bar chart
    _seriesData.add(
      charts.Series(
          domainFn: (CountProductsByDate countProductsByDate, _) =>
              countProductsByDate.date,
          measureFn: (CountProductsByDate countProductsByDate, _) =>
              countProductsByDate.count,
          id: '2018',
          data: data2,
          fillPatternFn: (_, __) => charts.FillPatternType.solid,
          fillColorFn: (CountProductsByDate users, _) {
            if (users.flag)
              return charts.ColorUtil.fromDartColor(Color(0xff50BFA1));
            return charts.ColorUtil.fromDartColor(Color(0xff1264d1));
          }),
    );

    // this is for the pir chart
    _seriesPieData.add(
      charts.Series(
        domainFn: (ProductByCat category, _) => category.category,
        measureFn: (ProductByCat category, _) => category.count,
        colorFn: (ProductByCat category, _) =>
            charts.ColorUtil.fromDartColor(category.colorval),
        id: 'WIBI',
        data: piedata,
        labelAccessorFn: (ProductByCat row, _) => '${row.count}',
      ),
    );

/*     _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'WIBI',
        data: linesalesdata,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff109618)),
        id: 'WIBI',
        data: linesalesdata1,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xffff9900)),
        id: 'Air Pollution',
        data: linesalesdata2,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    ); */
  }

  @override
  void initState() {
    super.initState();

    // ignore: deprecated_member_use
    _seriesData = List<charts.Series<CountProductsByDate, String>>();
    // ignore: deprecated_member_use
    _seriesPieData = List<charts.Series<ProductByCat, String>>();
    /*  // ignore: deprecated_member_use
    _seriesLineData = List<charts.Series<Sales, int>>(); */
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_left_rounded,
              size: 40.0,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => AdminScreen(),
                ),
              );
            },
          ),
          backgroundColor: Color(0xFF1264D1),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.bar_chart_rounded, size: 40)),
              Tab(icon: Icon(Icons.pie_chart_rounded, size: 32)),

              //Tab(icon: Icon(Icons.show_chart_rounded, size: 38)),
            ],
          ),
          centerTitle: true,
          title: Text(
            'Analytics',
            style: TextStyle(
              fontFamily: 'Product Sans',
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40.0,
                      ),
                      Text(
                        'User\'s Analytics',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Visby Round',
                          color: Color(0xFF1264D1),
                        ),
                      ),
                      SizedBox(height: 50),
                      Expanded(
                        child: charts.BarChart(
                          _seriesData,
                          animate: true,
                          barGroupingType: charts.BarGroupingType.grouped,
                          animationDuration: Duration(seconds: 2),
                          domainAxis: new charts.OrdinalAxisSpec(
                            renderSpec: new charts.SmallTickRendererSpec(
                              labelStyle: new charts.TextStyleSpec(
                                fontSize: 14,
                                fontFamily: 'Product Sans',
                                color: charts.Color.fromHex(code: '#342E37'),
                              ),
                              lineStyle: new charts.LineStyleSpec(
                                color: charts.Color.fromHex(code: '#1264D1'),
                              ),
                            ),
                          ),
                          primaryMeasureAxis: new charts.NumericAxisSpec(
                            renderSpec: new charts.GridlineRendererSpec(
                              labelStyle: new charts.TextStyleSpec(
                                fontSize: 13,
                                fontFamily: 'Product Sans',
                                color: charts.Color.fromHex(code: '#342E37'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40.0,
                      ),
                      Text(
                        'Product\'s Analytics',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Visby Round',
                          color: Color(0xFF1264D1),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Expanded(
                        child: charts.PieChart(
                          _seriesPieData,
                          animate: true,
                          animationDuration: Duration(seconds: 2),
                          defaultRenderer: new charts.ArcRendererConfig(
                            arcWidth: 100,
                            arcRendererDecorators: [
                              new charts.ArcLabelDecorator(
                                labelPosition: charts.ArcLabelPosition.inside,
                                insideLabelStyleSpec: new charts.TextStyleSpec(
                                    color:
                                        charts.Color.fromHex(code: '#ffffff'),
                                    fontSize: 15,
                                    fontFamily: "Product Sans"),
                              )
                            ],
                          ),
                          behaviors: [
                            new charts.DatumLegend(
                              position: charts.BehaviorPosition.bottom,
                              outsideJustification:
                                  charts.OutsideJustification.startDrawArea,
                              horizontalFirst: false,
                              desiredMaxRows: 6,
                              cellPadding:
                                  new EdgeInsets.only(right: 6.0, bottom: 6.0),
                              entryTextStyle: charts.TextStyleSpec(
                                  color: charts.Color.fromHex(code: '#342E37'),
                                  fontFamily: 'Product Sans',
                                  fontSize: 14),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),

            /*     Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 40.0,
                        ),
                        Text(
                          'Posted Products Analytics',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Visby Round',
                            color: Color(0xFF1264D1),
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Expanded(
                          child: charts.LineChart(
                            _seriesLineData,
                            defaultRenderer: new charts.LineRendererConfig(
                                includeArea: true, stacked: true),
                            animate: true,
                            animationDuration: Duration(seconds: 2),
                            primaryMeasureAxis: new charts.NumericAxisSpec(
                              renderSpec: new charts.GridlineRendererSpec(
                                labelStyle: new charts.TextStyleSpec(
                                  fontSize: 13,
                                  fontFamily: 'Product Sans',
                                  color: charts.Color.fromHex(code: '#342E37'),
                                ),
                              ),
                            ),
                            /*             domainAxis: new charts.OrdinalAxisSpec(
                              renderSpec: new charts.SmallTickRendererSpec(
                                labelStyle: new charts.TextStyleSpec(
                                  fontSize: 14,
                                  fontFamily: 'Product Sans',
                                  color: charts.Color.fromHex(code: '#342E37'),
                                ),
                                lineStyle: new charts.LineStyleSpec(
                                  color: charts.Color.fromHex(code: '#1264D1'),
                                ),
                              ),
                            ), */
                            behaviors: [
                              new charts.ChartTitle(
                                'Months',
                                behaviorPosition:
                                    charts.BehaviorPosition.bottom,
                                titleOutsideJustification:
                                    charts.OutsideJustification.middleDrawArea,
                                titleStyleSpec: charts.TextStyleSpec(
                                  fontFamily: "Product Sans",
                                  color: charts.Color.fromHex(code: '#342E37'),
                                  fontSize: 13,
                                ),
                              ),
                              new charts.ChartTitle(
                                'No. of Products',
                                behaviorPosition: charts.BehaviorPosition.start,
                                titleOutsideJustification:
                                    charts.OutsideJustification.middleDrawArea,
                                titleStyleSpec: charts.TextStyleSpec(
                                  fontFamily: "Product Sans",
                                  color: charts.Color.fromHex(code: '#342E37'),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ), */
          ],
        ),
      ),
    );
    //  );
  }
}

class CountProductsByDate {
  String date;
  int count;
  bool flag;

  CountProductsByDate(this.date, this.count, this.flag);
}

class ProductByCat {
  String category;
  int count;
  Color colorval;

  ProductByCat(this.category, this.count, this.colorval);
}

// class Users {
//   String place;
//   int active;
//   int inactive;

//   Users(this.active, this.place, this.inactive);
// }

class Category {
  String category;
  double categoryvalue;
  Color colorval;

  Category(this.category, this.categoryvalue, this.colorval);
}

class Sales {
  int yearval;
  int salesval;

  Sales(this.yearval, this.salesval);
}
