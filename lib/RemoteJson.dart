import 'package:WIBI/variables.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './Employee.dart';

class RemoteJson extends StatefulWidget {
  @override
  _RemoteJsonState createState() => _RemoteJsonState();
}

class _RemoteJsonState extends State<RemoteJson> {
  void post_product(String s) async {
    print(s);
    print("log");
    Map m = {"user_id": user_email, "product_id": s};
    print(m);
    /*   var encoded_data = jsonEncode(m);
    await http.post("http://10.0.2.2:8080/products", body: encoded_data); */
  }

  Future<List<Employee>> _getEmployee() async {
    var empData = await http.get("http://10.0.2.2:8080/products");
    var jsonData = json.decode(empData.body);
    List<Employee> employees = [];
    for (var emp in jsonData) {
      Employee employee = Employee(
        emp["title"],
        emp["category"],
        emp["location"],
        emp["image"],
        emp["id"],
      );
      employees.add(employee);
    }
    print(employees.length);
    return employees;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _getEmployee(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: Text("Loading..."),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    post_product(snapshot.data[index].id);
                  },
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(snapshot.data[index].image),
                  ),
                  title: Text(
                    snapshot.data[index].title,
                  ),
                  subtitle: Text(snapshot.data[index].id),
                );
              },
            );
          }
        },
      ),
    );
  }
}
