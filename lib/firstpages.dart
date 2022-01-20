// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:suitmedia_test/secondpages.dart';

// ignore: camel_case_types
class firstpages extends StatefulWidget {
  static String tag = 'login-page';

  const firstpages({Key? key}) : super(key: key);
  @override
  _firstpages createState() => _firstpages();
}

// ignore: camel_case_types
class _firstpages extends State<firstpages> {
  bool _isButtonDisabled = true;

  final myUsernameController = TextEditingController(text: '');
  final myPalindromeController = TextEditingController(text: '');

  void check() {
    // print(username.text);
    // print(password.text);
    String polindrome = myPalindromeController.text; //get value from textfield

    String? original = polindrome;
    String? str = original.toLowerCase();
    String? reverse = str.split('').reversed.join('');
    if (str == reverse) {
      _isButtonDisabled = false;
      Fluttertoast.showToast(
          msg: "is Palindrome",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "not Palindrome",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

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
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/btn_add_photo .png'),
      ),
    );

    final checkButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        style: raisedButtonStyle,
        onPressed: () {
          check();
        },
        child: const Text(
          "CHECK",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

    final nextButton = Padding(
      padding: const EdgeInsets.symmetric(),
      child: ElevatedButton(
        style: raisedButtonStyle,
        onPressed: () {
          String? Uname = myUsernameController.text; //get value from textfield

          if (_isButtonDisabled == false) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => secondpages(nama: Uname)));
          }
        },
        child: const Text(
          "NEXT",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.png"), fit: BoxFit.cover)),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              logo,
              const SizedBox(height: 48.0),
              TextFormField(
                controller: myUsernameController,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'Name',
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                controller: myPalindromeController,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'Polindrome',
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              checkButton,
              nextButton,
            ],
          ),
        ),
      ),
    );
  }
}
