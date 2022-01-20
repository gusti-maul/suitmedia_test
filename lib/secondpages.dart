// ignore_for_file: prefer_const_constructors, duplicate_ignore, avoid_unnecessary_containers, unnecessary_string_interpolations, unused_local_variable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:suitmedia_test/firstpages.dart';
import 'package:suitmedia_test/thirdpages.dart';

// ignore: camel_case_types
class secondpages extends StatefulWidget {
  final String nama;

  const secondpages({Key? key, required this.nama}) : super(key: key);

  @override
  _secondpagesState createState() => _secondpagesState();
}

// ignore: camel_case_types
class _secondpagesState extends State<secondpages> {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.cyan[900],
    primary: Colors.cyan[900],
    //minimumSize: Size(88, 36),
    padding: const EdgeInsets.all(12),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(24)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final UserButton = Padding(
      padding: const EdgeInsets.symmetric(),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton(
          style: raisedButtonStyle,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => GetData()));
          },
          child: const Text(
            "Choose a User",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          // ignore: prefer_const_constructors
          title: Text('Second Screen',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => firstpages()));
              },
              icon: Icon(Icons.arrow_back_ios, color: Colors.blue))),
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 12, left: 16, bottom: 8),
              child: Text("Welcome",
                  style: TextStyle(fontSize: 14, color: Colors.black)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, bottom: 18),
              child: Text("${widget.nama}",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text("Selected User Name",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                  const SizedBox(height: 16.0),
                  UserButton,
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
