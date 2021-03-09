import 'package:flutter/material.dart';

class UserDetails {
  String name;
  String email;
  String designation;
  String location;
  String contact;

  UserDetails(String name, String email, String designation, String location,
      String contact) {
    this.name = name;
    this.email = email;
    this.designation = designation;
    this.location = location;
    this.contact = contact;
  }

  Map mappedjson() {
    Map data = {
      "name": this.name,
      "email": this.email,
      "password": "hello",
      "location": this.location,
      "designation": this.designation,
      "contact": this.contact,
      "role": "user",
    };
    return data;
  }
}
