// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: GetData(),
  ));
}

class GetData extends StatelessWidget {
  final String apiUrl = "https://reqres.in/api/users?per_pages=5";

  get secondpages => null;

  Future<List<dynamic>> _fecthDataUsers() async {
    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body)['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          // ignore: prefer_const_constructors
          title: Text('Third Screen',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => secondpages()));
              },
              icon: Icon(Icons.arrow_back_ios, color: Colors.blue))),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: _fecthDataUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              NetworkImage(snapshot.data[index]['avatar']),
                        ),
                        title: Text(snapshot.data[index]['first_name'] +
                            " " +
                            snapshot.data[index]['last_name']),
                        subtitle: Text(snapshot.data[index]['email']),
                      ),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => secondpages(index)),
                        // );
                      },
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
